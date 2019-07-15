" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'ctrlpvim/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
" Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'mindriot101/vim-yapf'
Plug 'ambv/black'

call plug#end()

" basics
filetype plugin indent on
set nocompatible
set history=500
" do not create backup file.
set nobackup
" '20  - remember marks for 20 previous files
" \"50 - save 50 lines for each register
" :20  - remember 20 items in command-line history
" %    - remember the buffer list (if vim started without a file arg)
" n    - set name of viminfo file
set viminfo='20,\"50,:20,%,n~/.viminfo
" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")|execute("normal `\"")|endif
" allow movement to another buffer without saving the current one
set hidden
set scrolloff=5
" turn off error beep/flash
set noerrorbells
set visualbell
" set ruler
set showcmd
" show matching braces
set showmatch
" syntax highlighting
syntax on

" incremental search
set ic
set incsearch
set smartcase
set hlsearch

" because, Python
set tabstop=4
set expandtab
set smartindent
set shiftwidth=4
set nowrap

set backspace=indent,eol,start            " Allow backspace to go beyond insert start

set laststatus=2

"Use the arrows to something useful, buffer management.
"put @binarydud on this and watch him cry.
map <right> :bn<cr>
map <left> :bp<cr>
map <down> :bd<cr>

" ignore node dirs.
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|node_modules)$',
  \ 'file': '\v\.(pyc|swp)$',
  \ }

" 256 color mode.
set t_Co=256
colorscheme wombat256i

" highlight trailing whitespace so we catch it early.
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" PLUGINS =========
" use fancy airline fonts
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='wombat'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc

" ALE linters
 let g:ale_python_flake8_executable = 'python'
 let g:ale_python_flake8_options = '-m flake8 --max-complexity 13 --ignore=E501,E128'
 let g:ale_fixers = {
             \  'javascript': ['prettier'],
             \  'css': ['prettier']
             \}
" don't lint while editing, only on load and save.
let g:ale_lint_on_text_changed = 'never'
let g:airline#extensions#ale#enabled = 1

" Quickly navigate betwixt ale linting issues.
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:vim_markdown_folding_disabled=1

let g:airline#extensions#tabline#enabled = 1

au FileType ruby,html,htm,php,xml,javascript setlocal tabstop=2
au FileType ruby,html,htm,php,xml,javascript setlocal shiftwidth=2
au FileType ruby,html,htm,php,xml,javascript setlocal softtabstop=2

abbrev tablethrow (╯°□°)╯︵ ┻━┻

" When diffing, always be vertical.
set diffopt+=vertical

" Folding!
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2
