set nocompatible              " be iMproved, required
set encoding=utf-8
call plug#begin('~/.local/share/nvim/plugged')
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
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Quality of Life
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'easymotion/vim-easymotion'
Plug 'plytophogy/vim-virtualenv'
Plug 'dhruvasagar/vim-dotoo'
Plug 'jceb/vim-orgmode'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'jamessan/vim-gnupg'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
" Completion
Plug 'Valloric/YouCompleteMe'

" Lightline
Plug 'itchyny/lightline.vim'

" Airline
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'dracula/vim'
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'gosukiwi/vim-atom-dark'
Plug 'rakr/vim-one'
Plug 'kaicataldo/material.vim'
call plug#end()
" Indentation Add ability to see whitespace/eol set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣ Tab Sizes
" By default, the indent is 2 spaces.
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set breakindent

" Python
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

" Ale
let g:ale_linters = {'javascript': ['eslint'], 'python': ['flake8']}
let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_virtualenv_dir_names = ['env', '.env', 'venv', 'virtualenv']
let b:ale_virtualenv_dir_names = ['env', '.env', 'venv', 'virtualenv']

" Lightline
let g:lightline = { 'colorscheme': 'material_vim' }
" Airline
" let g:airline#extensions#tabline#enabled = 0
" let g:airline_powerline_fonts = 1
" let g:airline_theme='material'

" Emmet Leader
let g:user_emmet_leader_key='<C-k>'

" Git Gutter
let g:gitgutter_sign_added = '▋'
let g:gitgutter_sign_modified = '▋'
let g:gitgutter_sign_removed = '▋'
let g:gitgutter_sign_removed_first_line = '▋'
let g:gitgutter_sign_modified_removed = '▋'

" YCM
let g:ycm_autoclose_preview_window_after_insertion = 1

" vim-javascript
let g:javascript_plugin_flow = 1

" vim-jsx
let g:jsx_ext_required = 0

" Vue Crap

autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue

" Preferences
set number relativenumber
set nu rnu

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

""""""" Mappings
nmap <C-k>b :NERDTreeToggle<CR>

" Use tab completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Buffers
nmap <leader>l :ls<CR>
nmap <leader>] :bn!<CR>
nmap <leader>[ :bp!<CR>
nmap <leader>bd :bd<CR>
nmap <leader>bda :bd <C-a><CR>
nmap <leader>bds :b#<bar>bd#<CR>

" Fugitive
nmap <leader>gs :Gstatus<CR>

" FZF
nmap <leader>ff :Files<CR>
nmap <leader>fb :Buffers<CR>
nmap <leader>fg :GFiles<CR>
nmap <leader>fc :Colors<CR>
nmap <leader>fa :Ag<CR>
nmap <leader>fr :Rg<CR>

" Whitespace Character Toggle
nmap <leader>s :set list!<CR>

" GUI Settings
set guifont=Source\ Code\ Pro\ Semibold:h11:b
" set guifont=Operator\ Mono\ Lig\ Medium:h12

" Themes
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
set background=dark

"""""" Material Theme
let g:material_theme_style = 'dark'
let g:material_terminal_italics = 1
colorscheme material
