set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'sheerun/vim-polyglot'
Plug 'andymass/vim-matchup'

Plug 'janko-m/vim-test'


" Initialize plugin system
call plug#end()
