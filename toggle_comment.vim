" Deniz, 29/9/2020
" Toggles the comments on and off. Supports multiple visual lines

" TODO:
" - support for other languages: C, C++, Fortran, ...

"map gC :call Toggle_comment()<CR>

function! Toggle_comment()
    let ft = &filetype
    if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' 
        \ || ft == 'python' || ft == 'perl' || ft == 'yaml' || ft == 'yml'
    
        "get the current line under cursor and the first characters
        let cur_line = getline('.')
        let first_char = matchstr(cur_line, '[^ ]')
        let comment_char = '#'

        let nspaces = indent('.')  "number of spaces

        "get the leading spaces
        let spaces = matchstr(cur_line, '^\s*')
       
        " if the line starts (after spaces) with the comment character then 
        " uncomment it, vice versa
        if (first_char == comment_char)     "uncomment line
            "first group: the start of the line + zero or more spaces
            "second group: comment symbol + zero or more spaces
            "third group: rest of the line
            silent s/\(^ *\)\(# *\)\(.*\)/\1\3/

        else                                "comment line 
            "first group: start of the line + zero or more spaces
            "second group: rest of the line
            silent s/\(^ *\)\(.*\)$/\1# \2/
        endif
    endif
endfunction


function! Comment_on()
    let ft = &filetype
    if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' 
        \ || ft == 'python' || ft == 'perl' || ft == 'yaml' || ft == 'yml'

        silent s/\(^.*$\)/# \1/
    endif
endfunction


function! Comment_off()
    let ft = &filetype
    if ft == 'php' || ft == 'ruby' || ft == 'sh' || ft == 'make' 
        \ || ft == 'python' || ft == 'perl' || ft == 'yaml' || ft == 'yml'

        silent s/\(^# \)\(.*$\)/\2/
    endif
endfunction
