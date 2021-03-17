set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf.vim'

Plug 'sheerun/vim-polyglot'

Plug 'andymass/vim-matchup'
Plug 'janko-m/vim-test'

" Initialize plugin system
call plug#end()
