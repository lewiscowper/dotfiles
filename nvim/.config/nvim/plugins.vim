call plug#begin()

  " Sets up a lot of 'sensible defaults' to save me setting them
  Plug 'tpope/vim-sensible'

  " Adds mappings to easily deal with 'surrounds' in pairs
  Plug 'tpope/vim-surround'

  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'

  " Colourscheme
  Plug 'arcticicestudio/nord-vim'

  Plug 'airblade/vim-gitgutter'

  " This plugin saves me from my copy pasting woes
  Plug 'ConradIrwin/vim-bracketed-paste'

  " Highlight (and allow deletion of) trailing whitespace
  Plug 'ntpeters/vim-better-whitespace'

  " Insert mode autocompletion for punctuation that comes in pairs!
  Plug 'Raimondi/delimitMate'

  " Completion
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-go', { 'do': 'make'}

  " Linting with LSP
  Plug 'desmap/ale-sensible'
  Plug 'w0rp/ale'

  " Syntax plugins
  Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
  Plug 'elzr/vim-json', { 'for': 'json' }
  Plug 'godlygeek/tabular'
  Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
  Plug 'chr4/sslsecure.vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': ['go','godoc'] }
  Plug 'rust-lang/rust.vim', { 'for': 'rust' }
  Plug 'ekalinin/Dockerfile.vim', { 'for': 'dockerfile' }
  Plug 'fatih/vim-hclfmt'

call plug#end()

" Hit '%' on 'if' to jump to 'else'.
runtime macros/matchit.vim

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -r'

" Always leave space for git-gutter (aka sign column)
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

let g:ale_linters = {
\   'javascript': ['prettier'],
\}
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': ['prettier'],
\}
" let g:ale_sign_column_always = 1

" Use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

let g:deoplete#enable_at_startup = 1

let g:vim_markdown_frontmatter = 1
