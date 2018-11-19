if &compatible
  set nocompatible
endif

"                    ___       ___           ___                        ___           ___
"      ___          /  /\     /  /\         /  /\           ___        /  /\         /  /\
"     /  /\        /  /:/    /  /:/        /  /::\         /__/\      /  /::|       /  /::\
"    /  /::\      /  /:/    /  /:/        /  /:/\:\        \__\:\    /  /:|:|      /__/:/\:\
"   /  /:/\:\    /  /:/    /  /:/        /  /:/  \:\       /  /::\  /  /:/|:|__   _\_ \:\ \:\
"  /  /::\ \:\  /__/:/    /__/:/     /\ /__/:/_\_ \:\   __/  /:/\/ /__/:/ |:| /\ /__/\ \:\ \:\
" /__/:/\:\_\:\ \  \:\    \  \:\    /:/ \  \:\__/\_\/  /__/\/:/~~  \__\/  |:|/:/ \  \:\ \:\_\/
" \__\/  \:\/:/  \  \:\    \  \:\  /:/   \  \:\ \:\    \  \::/         |  |:/:/   \  \:\_\:\
"      \  \::/    \  \:\    \  \:\/:/     \  \:\/:/     \  \:\         |__|::/     \  \:\/:/
"       \__\/      \  \:\    \  \::/       \  \::/       \__\/         /__/:/       \  \::/
"                   \__\/     \__\/         \__\/                      \__\/         \__\/

call plug#begin('~/.local/share/nvim/plugged')
  " TComment
  Plug 'tomtom/tcomment_vim'
  " FZF
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  " CtrlP
  Plug 'ctrlpvim/ctrlp.vim'
  " Light easymotion
  Plug 'justinmk/vim-sneak'
  " JavaScript
  Plug 'pangloss/vim-javascript'
  " JSX
  Plug 'mxw/vim-jsx'
  " JSON
  Plug 'leshill/vim-json'
  " Styled Components
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  " Golang plugin adding tons of fun options
  Plug 'fatih/vim-go'
  " Rust plugin
  Plug 'rust-lang/rust.vim'
  " Dockerfile syntax
  Plug 'docker/docker'
  " Kubernetes syntax
  Plug 'andrewstuart/vim-kubernetes'
  " Vim CSS colours
  Plug 'ap/vim-css-color'
  " Editorconfig
  Plug 'editorconfig/editorconfig-vim'
  " Asynchronous Lint Engine
  Plug 'w0rp/ale'
  " Highlight whitespace (and enable trimming it)
  Plug 'ntpeters/vim-better-whitespace'
  " vim surround
  Plug 'tpope/vim-surround'
  " gitgutter
  Plug 'airblade/vim-gitgutter'
  " Auto close parentheses etc
  Plug 'cohama/lexima.vim'
  " Completion framework
  if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif
  " TernJS completion
  Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
  " Go completion
  Plug 'zchee/deoplete-go', { 'do': 'make'}
  " Colour scheme
  Plug 'arcticicestudio/nord-vim'
call plug#end()

"                    ___       ___           ___                        ___
"      ___          /  /\     /  /\         /  /\           ___        /  /\
"     /  /\        /  /:/    /  /:/        /  /::\         /__/\      /  /::|
"    /  /::\      /  /:/    /  /:/        /  /:/\:\        \__\:\    /  /:|:|
"   /  /:/\:\    /  /:/    /  /:/        /  /:/  \:\       /  /::\  /  /:/|:|__
"  /  /::\ \:\  /__/:/    /__/:/     /\ /__/:/_\_ \:\   __/  /:/\/ /__/:/ |:| /\
" /__/:/\:\_\:\ \  \:\    \  \:\    /:/ \  \:\__/\_\/  /__/\/:/~~  \__\/  |:|/:/
" \__\/  \:\/:/  \  \:\    \  \:\  /:/   \  \:\ \:\    \  \::/         |  |:/:/
"      \  \::/    \  \:\    \  \:\/:/     \  \:\/:/     \  \:\         |__|::/
"       \__\/      \  \:\    \  \::/       \  \::/       \__\/         /__/:/
"                   \__\/     \__\/         \__\/                      \__\/
"
"      ___                                                    ___           ___           ___
"     /  /\          ___           ___            ___        /  /\         /  /\         /  /\
"    /  /::\        /  /\         /__/\          /__/\      /  /::\       /  /::|       /  /::\
"   /  /:/\:\      /  /::\        \  \:\         \__\:\    /  /:/\:\     /  /:|:|      /__/:/\:\
"  /  /:/  \:\    /  /:/\:\        \__\:\        /  /::\  /  /:/  \:\   /  /:/|:|__   _\_ \:\ \:\
" /__/:/ \__\:\  /  /::\ \:\       /  /::\    __/  /:/\/ /__/:/ \__\:\ /__/:/ |:| /\ /__/\ \:\ \:\
" \  \:\ /  /:/ /__/:/\:\_\:\     /  /:/\:\  /__/\/:/~~  \  \:\ /  /:/ \__\/  |:|/:/ \  \:\ \:\_\/
"  \  \:\  /:/  \__\/  \:\/:/    /  /:/__\/  \  \::/      \  \:\  /:/      |  |:/:/   \  \:\_\:\
"   \  \:\/:/        \  \::/    /__/:/        \  \:\       \  \:\/:/       |__|::/     \  \:\/:/
"    \  \::/          \__\/     \__\/          \__\/        \  \::/        /__/:/       \  \::/
"     \__\/                                                  \__\/         \__\/         \__\/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Nord/Colourscheme
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set background =dark

colorscheme nord

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" MacVim skip colourscheme loading
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running")
  let macvim_skip_colorscheme =1
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" MacVim remove scrollbars
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("gui_running")
  set guioptions =
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Asynchronous Lint Engine (ale)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fix files automatically on save
let g:ale_fix_on_save =1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Gitgutter
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Always leave space for the git-gutter (aka sign column)
if exists('&signcolumn')
  set signcolumn =yes
else
  let g:gitgutter_sign_column_always =1
endif

" Use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Ctrl+P
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use ctrl+p to enable Ctrl+P
let g:ctrlp_map='<c-p>'
let g:ctrlp_cmd='CtrlP'

" Show hidden files in Ctrl+P
let g:ctrlp_show_hidden=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim-jsx
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't require a .jsx extension to lint as JSX
let g:jsx_ext_required=0

" Set colourful config for jsx highlighting
let g:vim_jsx_pretty_colorful_config=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Deoplete
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Deoplete-go
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#sources#go#gocode_binary=$GOPATH.'/bin/gocode'

"                    ___           ___           ___           ___
"      ___          /  /\         /  /\         /  /\         /  /\
"     /  /\        /  /:/        /  /::|       /  /::\       /  /::\
"    /  /::\      /  /:/        /  /:|:|      /  /:/\:\     /__/:/\:\
"   /  /:/\:\    /  /:/        /  /:/|:|__   /  /:/  \:\   _\_ \:\ \:\
"  /  /::\ \:\  /__/:/     /\ /__/:/ |:| /\ /__/:/ \  \:\ /__/\ \:\ \:\
" /__/:/\:\ \:\ \  \:\    /:/ \__\/  |:|/:/ \  \:\  \__\/ \  \:\ \:\_\/
" \__\/  \:\_\/  \  \:\  /:/      |  |:/:/   \  \:\        \  \:\_\:\
"      \  \:\     \  \:\/:/       |__|::/     \  \:\        \  \:\/:/
"       \__\/      \  \::/        /__/:/       \  \:\        \  \::/
"                   \__\/         \__\/         \__\/         \__\/

function! GitBranch() abort
  return system("git rev-parse --abrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! GitStatus() abort
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
  \ '%dW %dE',
  \ l:all_non_errors,
  \ l:all_errors
  \)
endfunction

"      ___                       ___                         ___           ___
"     /  /\        ___          /  /\          ___          /  /\         /  /\
"    /  /::\      /__/\        /  /::\        /__/\        /  /:/        /  /::\
"   /__/:/\:\     \  \:\      /  /:/\:\       \  \:\      /  /:/        /__/:/\:\
"  _\_ \:\ \:\     \__\:\    /  /::\ \:\       \__\:\    /  /:/        _\_ \:\ \:\
" /__/\ \:\ \:\    /  /::\  /__/:/\:\_\:\      /  /::\  /__/:/     /\ /__/\ \:\ \:\
" \  \:\ \:\_\/   /  /:/\:\ \__\/  \:\/:/     /  /:/\:\ \  \:\    /:/ \  \:\ \:\_\/
"  \  \:\_\:\    /  /:/__\/      \__\::/     /  /:/__\/  \  \:\  /:/   \  \:\_\:\
"   \  \:\/:/   /__/:/           /  /:/     /__/:/        \  \:\/:/     \  \:\/:/
"    \  \::/    \__\/           /__/:/      \__\/          \  \::/       \  \::/
"     \__\/                     \__\/                       \__\/         \__\/

" The most important option for statuslines, always display it
set laststatus =2

" Clear anything existing from the statusline to begin with
set statusline =

" Add full path (truncated to last 40 characters)
set statusline +=%.40F

" Add modified flag
set statusline +=%m

" Left/Right separator
set statusline +=%=

" {currentLine}/{TotalLines}
set statusline +=%l/%L

" Add git branch
set statusline +=\ %{GitStatus()}

" Add linter errors
" set statusline +=\ %{LinterStatus()}

"      ___           ___                         ___
"     /  /\         /  /\          __           /  /\
"    /  /:/        /  /::\        |  |\        /  /::\
"   /  /:/        /  /:/\:\       |  |:|      /__/:/\:\
"  /  /::\____   /  /::\ \:\      |  |:|     _\_ \:\ \:\
" /__/:/\:::::\ /__/:/\:\ \:\     |__|:|__  /__/\ \:\ \:\
" \__\/~|:|~~~~ \  \:\ \:\_\/     /  /::::\ \  \:\ \:\_\/
"    |  |:|      \  \:\ \:\      /  /:/~~~~  \  \:\_\:\
"    |  |:|       \  \:\_\/     /__/:/        \  \:\/:/
"    |__|:|        \  \:\       \__\/          \  \::/
"     \__\|         \__\/                       \__\/

" Automagically add rel="noopener" when using target="_blank"
iab target="_blank" target="_blank" rel="noopener"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>

" Double tap space to centre the screen
nnoremap <space><space> zz

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" disable arrow keys because learning
noremap <up> <nop>
inoremap <up> <nop>
noremap <down> <nop>
inoremap <down> <nop>
noremap <left> <nop>
inoremap <left> <nop>
noremap <right> <nop>
inoremap <right> <nop>

" Make capital Y work the same as capital D or capital C
noremap Y y$

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Global leader shortcuts
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" leader + / to toggle search highlights
nnoremap <leader>/ :set hlsearch!<CR>

" Quick saving with leader + w
nnoremap <leader>w :w!<CR>

" Quick save and quit with leader + wq
nnoremap <leader>wq :wq!<CR>

" reloads .vimrc -- making all changes active
map <silent> <leader>v :source ~/.config/nvim/init.vim<CR>:PlugInstall<CR>:bdelete<CR>:exe ":echo 'init.vim reloaded'"<CR>

" autocomplete mapped to leader + enter
inoremap <leader><C-m> <C-n>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" leader C is for Code related mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Comment line
noremap <silent> <leader>cc :TComment<CR>
noremap <silent> <leader>cs :StripWhitespace<CR>
nnoremap <silent> <leader>c<Space> za


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" leader F is for file related mappings (open, browse...)
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>f :CtrlP<CR>
nnoremap <silent> <leader>fm :CtrlPMRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" leader B for buffer related mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <leader>b :CtrlPBuffer<CR> " cycle between buffer
nnoremap <silent> <leader>bb :bn<CR> "create (N)ew buffer
nnoremap <silent> <leader>bd :bdelete<CR> "(D)elete the current buffer
nnoremap <silent> <leader>bu :bunload<CR> "(U)nload the current buffer
nnoremap <silent> <leader>bl :setnomodifiable<CR> " (L)ock the current buffer"

"      ___                                       ___
"     /  /\          ___           ___          /  /\
"    /  /::\        /  /\         /__/\        /  /::\
"   /  /:/\:\      /  /::\        \  \:\      /__/:/\:\
"  /  /:/  \:\    /  /:/\:\        \__\:\    _\_ \:\ \:\
" /__/:/ \__\:\  /  /::\ \:\       /  /::\  /__/\ \:\ \:\
" \  \:\ /  /:/ /__/:/\:\_\:\     /  /:/\:\ \  \:\ \:\_\/
"  \  \:\  /:/  \__\/  \:\/:/    /  /:/__\/  \  \:\_\:\
"   \  \:\/:/        \  \::/    /__/:/        \  \:\/:/
"    \  \::/          \__\/     \__\/          \  \::/
"     \__\/                                     \__\/

" Don't offer to open certain files/directories
set wildignore +=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore +=*.pdf,*.psd
set wildignore +=node_modules/*

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Set shell to zsh
set shell =/bin/zsh

" Set UTF-8 encoding
set encoding =utf-8
scriptencoding utf-8

" Try to wrap at 100 characters
set textwidth =100

" But don't wrap on load
set nowrap

" And not while typing either
set formatoptions -=t

" Add a marker to the column 1 column after character 100
set colorcolumn =+1

" Update statusline every 250ms
set updatetime =250

" Enable syntax highlighting assuming another plugin or file hasn't switched it on already
if !exists('g:syntax_on')
  syntax enable
endif

" Detect filetype of file in editor
filetype plugin indent on

" Set highlight search off by default
set hlsearch!

" Speed up syntax highlighting
set nocursorcolumn
set nocursorline
syntax sync minlines=256
set synmaxcol =300
set regexpengine =1

" Time out on key codes, but not mappings
set notimeout
set ttimeout
set ttimeoutlen =10

" Show file options above the command line
set wildmenu

" Indent according to the previous line
set autoindent

" But be smart about it
set smartindent

" Set indent characters up to two spaces
set expandtab
set tabstop =2
set softtabstop =2
set shiftwidth =2

" >> will indent to a multiple of shiftwidth
set shiftround

" Highlight current line
set cursorline

" Make backspace work the way I anticipate
set backspace =indent,eol,start

" Switch between buffers without having to save first
set hidden

" Show as much of a long line instead of an @ at the end of a file
set display +=lastline

" Show current mode in command line
set showmode

" Show already typed keys when more are expected
set showcmd

" Show matching paren on hover
set showmatch

" Highlight when searching with / or ?
set incsearch

" Ignore case if typing in all lower case
set ignorecase

" But if I type an upper case character, suddenly care about case
set smartcase

" Lazy redrawing, apparently leads to faster macros
set lazyredraw

" Faster redrawing for terminal vim
set ttyfast

" Don't beep at me
set visualbell

" Open new windows below/right of the current window
set splitbelow
set splitright

" Searches wrap around end-of-file
set wrapscan

" Always report changed lines
set report =0

" Only syntax highlight the first 200 columns
set synmaxcol =200

" Show non-printable characters
set list

" Allow recursive search
set path +=**

" Set up whitespace characters for utf-8 vs no utf-8
if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars ='tab:▸ ,extends:❯,precedes:❮,nbsp:±'
else
  let &listchars ='tab:> ,extends:>,precedes:<,nbsp:.'
endif

" Make vim respect the XDG base directory spec.
set directory=$XDG_CACHE_HOME/nvim,~/,/tmp
set backupdir=$XDG_CACHE_HOME/nvim,~/,/tmp
set runtimepath=$XDG_CONFIG_HOME/nvim,$XDG_CONFIG_HOME/nvim/after,$VIM,$VIMRUNTIME
let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc"

" Turn off command logging to external file
set viminfo=

" Autocommands {{{1
if has('autocmd')
  " Re-source vimrc whenever changes are saved
  autocmd BufWritePost vimrc source $MYVIMRC
endif
