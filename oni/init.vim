set nocompatible              " be iMproved, required
set encoding=utf-8
call plug#begin('~/.config/oni/plugins')

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Docker
Plug 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
" Syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'digitaltoad/vim-pug'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'gko/vim-coloresque'
Plug 'jiangmiao/auto-pairs'
Plug 'posva/vim-vue'
Plug 'cakebaker/scss-syntax.vim'
" Quality of Life
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'plytophogy/vim-virtualenv'
Plug 'dhruvasagar/vim-dotoo'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-surround'
" Themes
Plug 'agreco/vim-citylights'
Plug 'arcticicestudio/nord-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'sonph/onehalf'
Plug 'jnurmine/Zenburn'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'jacoborus/tender.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'kaicataldo/material.vim'
call plug#end()

" Indentation
" Add ability to see whitespace/eol
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" Tab Sizes
" By default, the indent is 2 spaces.
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Python
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

" Ale
let g:ale_linters = {'javascript': ['eslint'], 'python': ['flake8']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_virtualenv_dir_names = ['env', '.env', 'venv', 'virtualenv']
let b:ale_virtualenv_dir_names = ['env', '.env', 'venv', 'virtualenv']

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" Vim Todo Agenda
let g:dotoo#agenda#files = ['~/Cloud/Orgs/*.org']

" Buffers
nmap <leader>l :ls<CR>:b<space>
nmap <leader>] :bn!<CR>
nmap <leader>[ :bp!<CR>
nmap <leader>bd :bd<CR>
nmap <leader>bda :bd <C-a><CR>
nmap <leader>bds :b#<bar>bd#<CR>

" Theme Stuff
set background=dark
colorscheme material
let g:material_theme_style = 'dark'
" Oni Stuff
set number
set noswapfile
set smartcase

" Turn off statusbar, because it is externalized
set noshowmode
set noruler
set laststatus=0
set noshowcmd

" Enable GUI mouse behavior
set mouse=a
" Whitespace Character Toggle
nmap <leader>s :set list!<CR>
