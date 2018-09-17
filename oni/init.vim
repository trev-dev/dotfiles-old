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
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
" Quality of Life
Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'plytophogy/vim-virtualenv'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Add ability to see whitespace/eol
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

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

""""""" Key Mappings
" NerdTree
nmap <leader>l :NERDTreeToggle<CR>

" Fugitive
nmap <leader>gs :Gstatus<CR>

" Buffers
nmap <leader>] :bn!<CR>
nmap <leader>[ :bp!<CR>
nmap <C-S-]> :tabprevious<CR>
nmap <C-S-[> :tabnext<CR>
nmap <leader>bd :bd<CR>
nmap <leader>bda :bd <C-a><CR>
nmap <leader>bds :b#<bar>bd#<CR>

" Emmet Leader
let g:user_emmet_leader_key='<C-m>'

" FZF
nmap <leader>ff :Files<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fg :GFiles<CR>
nmap <leader>fc :Colors<CR>
nmap <leader>fa :Ag<CR>
nmap <leader>fr :Rg<CR>

" Git Gutter
let g:gitgutter_sign_added = '▍'
let g:gitgutter_sign_modified = '▍'
let g:gitgutter_sign_removed = '▍'
let g:gitgutter_sign_removed_first_line = '▍'
let g:gitgutter_sign_modified_removed = '▍'

" Toggle relative number
nmap <leader>r :set relativenumber!<CR>

" Theme Stuff
set background=dark
colorscheme material
let g:material_theme_style = 'dark'
" Oni Stuff
set number
set relativenumber
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
