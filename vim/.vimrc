" VUNDLE CONFIG ------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
set encoding=utf-8

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"""""

" Git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" Docker
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
" Themes
Plugin 'ayu-theme/ayu-vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'fcpg/vim-fahrenheit'
Plugin 'jacoborus/tender.vim'
Plugin 'trev-dev/gentle.vim'
Plugin 'erizocosmico/vim-firewatch'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'
" Syntax
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'digitaltoad/vim-pug'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'gko/vim-coloresque'
Plugin 'jiangmiao/auto-pairs'
" Quality of Life
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'plytophogy/vim-virtualenv'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ----------------------------------------------------
" Colors
syntax on
set t_Co=256
function! AdaptColorscheme()
	highlight clear CursorLine
	highlight Normal ctermbg=NONE guibg=NONE
	highlight LineNr ctermbg=NONE guibg=NONE
	highlight Folded ctermbg=NONE guibg=NONE
	highlight NonText ctermbg=NONE guibg=NONE
	highlight SpecialKey ctermbg=NONE guibg=NONE
	highlight VertSplit ctermbg=NONE guibg=NONE
	highlight SignColumn ctermbg=NONE guibg=NONE
	" set term=screen-256color
endfunction
autocmd ColorScheme * call AdaptColorscheme()

colorscheme fahrenheit

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


" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline_theme='ubaryd'

" Ale
let g:ale_linters = {'javascript': ['eslint'], 'python': ['flake8']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_virtualenv_dir_names = ['env', '.env', 'venv', 'virtualenv']
let b:ale_virtualenv_dir_names = ['env', '.env', 'venv', 'virtualenv']

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" CtrlP
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1
" Preferences
set number

""""""" Mappings
nmap <C-b> :NERDTreeToggle<CR>

" Buffers
nmap <leader>l :ls<CR>:b<space>
nmap <leader>] :bn!<CR>
nmap <leader>[ :bp!<CR>
nmap <leader>bd :bd<CR>
nmap <leader>bda :bd <C-a><CR>
nmap <leader>bds :b#<bar>bd#<CR>


" Whitespace Character Toggle
nmap <leader>s :set list!<CR>

" Don't navigate with arrow buttons!
nmap <Up> :echo 'STOP THAT!'<CR>
nmap <Down> :echo 'IDIOT!'<CR>
nmap <Left> :echo 'NOPE!'<CR>
nmap <Right> :echo 'NO RIGHT ONLY WRONG!'<CR>

" Functions! ------------------------
" String Swapper
function! Mirror(dict)
  for [key, value] in items(a:dict)
    let a:dict[value] = key
  endfor
  return a:dict
endfunction

function! S(number)
  return submatch(a:number)
endfunction

function! SwapWords(dict, ...)
  let words = keys(a:dict) + values(a:dict)
  let words = map(words, 'escape(v:val, "|")')
  if(a:0 == 1)
    let delimiter = a:1
  else
    let delimiter = '/'
  endif
  let pattern = '\v(' . join(words, '|') . ')'
  exe '%s' . delimiter . pattern . delimiter
        \ . '\=' . string(Mirror(a:dict)) . '[S(0)]'
        \ . delimiter . 'g'
endfunction
