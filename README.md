Don't forget to put the following to the .vimrc

```
"comment and uncomment line shortcuts
source ~/.vim/toggle_comment.vim
map <C-q> : call Toggle_comment()<CR>
map <C-k> : call Comment_on()<CR>
map <C-k><C-u> : call Comment_off()<CR>
```
