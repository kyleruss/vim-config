set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin

set t_Co=256

filetype plugin indent on

execute pathogen#infect()
syntax on

autocmd vimenter * NERDTree

set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L

set background=dark
colorscheme gentooish_modified
hi Normal ctermbg=NONE

set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set guifont=Droid\Sans\ Mono
set ai

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_save = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_check_on_w = 0

let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jshint_exec = 'jsxhint'
autocmd vimenter * SyntasticToggleMode

command Stc SyntasticCheck
command Str SyntasticReset

function! RunJavaClass()
call inputsave()
let class_name	=	input('Enter class:')
call inputrestore()
execute "!java -cp %:p:h " . class_name
endfunction

autocmd Filetype java set makeprg=javac\ %:p:h/*.java
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F5> :make<Return>:copen<Return>
map <F6> :!java -cp %:p:h