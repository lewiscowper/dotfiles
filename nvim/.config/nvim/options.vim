" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

set number
set relativenumber

" Only care about case if it looks like that's what is wanted
set ignorecase
set smartcase

" Set indent characters to two spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Use fzf in vim
set rtp+=/usr/local/opt/fzf

" Fix lagging movement
set lazyredraw

" autoread and autowrite
augroup save
  au!
  au FocusLost * wall
augroup END
set autoread
set autowrite
set autowriteall

" ಠ_ಠ - my poor cluttered $HOME directory
set nohidden
set nobackup
set noswapfile
set nowritebackup
set viminfo=""

" persistent-undo
set undodir="$XDG_CACHE_HOME/nvim/undo"
set undofile

" Move netrwhist to XDG_CACHE_HOME
let g:netrw_home="$XDG_CACHE_HOME/nvim"

" We'll show the mode in the status bar, no need now
set noshowmode

" More natural split opening positions
set splitbelow
set splitright

" Wrap at 79 characters
set wrap
set textwidth=79
set formatoptions-=l
