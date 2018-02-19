set nocompatible
filetype plugin indent on
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

" Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'ruby-matchit'

" Elixir
Plugin 'elixir-lang/vim-elixir'

call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on           " required by wimwiki
