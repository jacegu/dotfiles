set nocompatible
filetype off

" Make sure you use single quotes
call plug#begin('~/.vim/plugged')

" https://github.com/sonph/onehalf
Plug 'sonph/onehalf', { 'rtp': 'vim' }
" https://github.com/preservim/nerdtree
Plug 'scrooloose/nerdtree'
" https://github.com/ryanoasis/vim-devicons
Plug 'ryanoasis/vim-devicons'
" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


Plug 'sheerun/vim-polyglot'
Plug 'andymass/vim-matchup'

Plug 'janko-m/vim-test'

" Initialize plugin system
call plug#end()
