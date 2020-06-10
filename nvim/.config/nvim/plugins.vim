call plug#begin()

  " Sets up a lot of 'sensible defaults' to save me setting them
  Plug 'tpope/vim-sensible'

  " Adds mappings to easily deal with 'surrounds' in pairs
  Plug 'tpope/vim-surround'

  Plug 'tpope/vim-commentary'

  " Colourscheme
  Plug 'arcticicestudio/nord-vim'

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

  " Sidebar with tag support
  Plug 'liuchengxu/vista.vim'

  " Syntax plugins
  Plug 'godlygeek/tabular'
  Plug 'chr4/sslsecure.vim'
  Plug 'fatih/vim-hclfmt'
  Plug 'towolf/vim-helm'

  Plug 'bling/vim-bufferline'

call plug#end()

let g:vim_markdown_frontmatter = 1

" Disable markdown auto folding
let g:vim_markdown_folding_disabled = 1

let g:bufferline_echo = 0

let g:vista_default_executive = "coc"

let g:vista_icon_indent = ["▸ ", ""]

let g:vista#renderer#icons = {
\   "string": "\"\"",
\   "boolean": "\uf702",
\  }

let g:vista_sidebar_width = 50
