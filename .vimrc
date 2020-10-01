" vimplug installation
call plug#begin('~/.vim/plugged') 
	Plug 'scrooloose/nerdtree'
	Plug 'itchyny/lightline.vim'
	Plug 'vim-scripts/taglist.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end() 

" General setup
syntax on
set ts=4
set number
set splitbelow splitright
set hls is ic
set autoread wildmode=longest,list,full
set backspace=indent,eol,start confirm
set shiftwidth=4 autoindent smartindent tabstop=4 softtabstop=4 expandtab  
set cmdheight=1
" activate lightline
set laststatus=2
filetype plugin indent on
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" disable coc.vim in these file extensions
autocmd BufNewFile *.md,*.json,*.vim,*.lua execute "silent! CocDisable" 
""" Custom indentation configuration
" for python
autocmd BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent

" TagList setup
map <F3> : TlistToggle<CR>
let Tlist_Use_Right_Window = 1

" NerdTree Setup
map <F2> : NERDTree<CR>

" code for template snippets
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.sh 0r ~/.vim/templates/template.sh
    autocmd BufNewFile *.c 0r ~/.vim/templates/template.c
    autocmd BufNewFile *.cpp 0r ~/.vim/templates/template.cpp
    autocmd BufNewFile *.java 0r ~/.vim/templates/template.java
    autocmd BufNewFile *.php 0r ~/.vim/templates/template.php
    autocmd BufNewFile *.py 0r ~/.vim/templates/template.py
    autocmd BufNewFile *.html 0r ~/.vim/templates/template.html
  augroup END
endif

" Remapping the loader key
let mapleader = "/"
" Open terminal in vim
map <leader>t :below terminal<CR>
map <leader>v :botright vertical terminal<CR>

"####### Open markdown file on the browser
" Function definition
function! Vim_MD_Preview()
    let curr_file = expand('%:p')
    call system("brave-browser " . curr_file . " 1>/dev/null 2>/dev/null &")
endfunction
"Key mapping
autocmd FileType markdown map <Leader>s :call Vim_MD_Preview()<CR>

"####### UnSet the Line Number in vim
map <Leader>n :exec("set number!")<CR>  

" If running inside tmux session then set 'delek' theme
if exists('$TMUX')
    :colo delek
    " Keymap for resize panels
    nnoremap <C-k> :resize +2<CR>
    nnoremap <C-j> :resize -2<CR>
    nnoremap <C-h> :vertical resize +2<CR>
    nnoremap <C-l> :vertical resize -2<CR>
else 
    " Keymap for resize panels
    nnoremap <C-Up> :resize +2<CR>
    nnoremap <C-Down> :resize -2<CR>
    nnoremap <C-Left> :vertical resize +2<CR>
    nnoremap <C-Right> :vertical resize -2<CR>
endif  

nnoremap Q <nop>  
