set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'itchyny/lightline.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'hdima/python-syntax'
Plugin 'mileszs/ack.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/ZoomWin'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Python highlighting
let python_highlight_all=1
syntax on

" Turn on solarized theme
"set background=dark
"let g:solarized_termcolors=256
"colorscheme solarized

" CtrlP config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_max_files=0 
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --python --nocolor -g ""'
endif

" Line numbering
set number relativenumber

" NerdTree
let NERDTreeIgnore=['\.pyc$', '\~$']

" Remap window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Configure ag as search
if executable('ag')
  let g:ackprg = 'ag --python --vimgrep'
endif
cnoreabbrev ag Ack

" Turn off linting except for save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let g:ycm_autoclose_preview_window_after_completion=1
map <C-g> :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Make is so backspace in insert mode works properly
set backspace=2
if $TMUX == ''
    set clipboard+=unnamed
endif

set colorcolumn=100
set mouse=n
set ttymouse=xterm2
