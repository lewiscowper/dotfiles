call plug#begin()

  " Sets up a lot of 'sensible defaults' to save me setting them
  Plug 'tpope/vim-sensible'

  " Adds mappings to easily deal with 'surrounds' in pairs
  Plug 'tpope/vim-surround'

  Plug 'tpope/vim-commentary'

  " Colourscheme
  Plug 'arcticicestudio/nord-vim'

  Plug 'airblade/vim-gitgutter'

  " This plugin saves me from my copy pasting woes
  Plug 'ConradIrwin/vim-bracketed-paste'

  " Allows tmux focus events to do things
  Plug 'tmux-plugins/vim-tmux-focus-events'

  " Highlight (and allow deletion of) trailing whitespace
  Plug 'ntpeters/vim-better-whitespace'

  " Insert mode autocompletion for punctuation that comes in pairs!
  Plug 'Raimondi/delimitMate'

  " Linting with LSP
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }

  " Syntax plugins
  Plug 'godlygeek/tabular'
  Plug 'chr4/sslsecure.vim'
  Plug 'fatih/vim-hclfmt'
  Plug 'towolf/vim-helm'

  Plug 'bling/vim-bufferline'

call plug#end()

" Always leave space for git-gutter (aka sign column)
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" Use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

let g:vim_markdown_frontmatter = 1

" Disable markdown auto folding
let g:vim_markdown_folding_disabled = 1

let g:bufferline_echo = 0

