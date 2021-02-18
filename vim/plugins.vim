set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle
Plugin 'VundleVim/Vundle.vim'

" Basic
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'

Plugin 'matchit.zip'
Plugin 'janko-m/vim-test'

Plugin 'junegunn/fzf.vim'


" Ruby
" Plugin 'ruby-matchit'

" Elixir
Plugin 'slashmili/alchemist.vim'


call vundle#end()            " required
filetype plugin indent on    " required
