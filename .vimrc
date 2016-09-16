""" Leader key
let g:mapleader = "\<Space>"

"""
""" Pathogen
"""
execute pathogen#infect()


"""
""" Vundle 
"""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Vundle
Plugin 'VundleVim/Vundle.vim'
" Airling and themes
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
" Theme Plugin
Plugin 'jnurmine/Zenburn'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'juanedi/predawn.vim'
" Ctrl P full path fuzzy finder
Plugin 'ctrlpvim/ctrlp.vim'
"Linting Plugin
Plugin 'scrooloose/syntastic'
" Fzf Plugin
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'
" NerdTree
Plugin 'scrooloose/nerdtree'
" Golden ration activated
Plugin 'roman/golden-ratio'
call vundle#end()
filetype plugin indent on


"""
""" Remappings
"""
" .vimrc management
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" Visual selection (word)
:nnoremap vv viw

" Open file in browser
nnoremap <F5> :!open -a Google\ Chrome %<CR><CR>

" Open NerdTree
nnoremap <leader>n :NERDTreeToggle<CR><CR>

" Return the number of occurrence of the word under the cursor
nnoremap <leader>* *<C-O>:%s///gn<CR>

" Open FZF
nnoremap <leader>f :FZF<CR>

" Motion keys
nnoremap H ^
nnoremap L $

:nnoremap <leader><Tab> <C-^> <CR>

"""
""" Settings
"""

" Show line number
set number
filetype on

" Tabs and indents
set expandtab
set autoindent
set shiftwidth=2
set softtabstop=2

" Enable folding
set nofoldenable     
set foldmethod=indent

" File enconding
set encoding=utf-8
set fileencoding=utf-8

" File extensions
au BufRead,BufNewFile *.md set filetype=markdown

" Colorscheme 
syntax enable

" If terminal background is light
colorscheme default
" Nice light / dark background
"colorscheme solarized
" If terminal background is dark 
"colorscheme slate

" Airline specs
set laststatus=2
let g:airline_powerline_fonts = 1
set t_Co=256

" Fix an issue with CtrlP where files were not found
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Fix the delete key
set backspace=indent,eol,start

" Add plugin for eslint
let local_eslint = finddir('node_modules', '.;') . '/.bin/eslint'
if matchstr(local_eslint, "^\/\\w") == ''
  let local_eslint = getcwd() . "/" . local_eslint
endif
if executable(local_eslint)
  let g:syntastic_javascript_eslint_exec = local_eslint
endif
let g:syntastic_javascript_checkers = ['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
