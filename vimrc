source ~/.vim/plugins-vundle.vim

" set mouse support
set ttyfast
" set mouse=a
set ttymouse=xterm2

" this must be first, because it changes other options as a side effect
set nocompatible

" enable per-directory .vimrc files
set exrc
" disable unsafe commands in local .vimrc files
set secure

" remove swap and backup files from your working directory
set backupdir=~/.vim/backups,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/backups,~/.tmp,~/tmp,/var/tmp,/tmp

" allow backgrounding buffers without writing them,
" and remember marks/undo for backgrounded buffers
set hidden

" remember more commands and search history
set history=100

" shell selection
set shell=fish

syntax on
set visualbell

set encoding=utf-8

" show when you are in insert or visual mode
set showmode

" highlight the line containing the cursor
set cursorline

" show unwanted whitespaces
set listchars=tab:-✈,trail:,extends:>,nbsp:◊
set list!

" fast terminal connection
set ttyfast

" show filename in title window
set title

" show line numbers
set number

" do not wrap lines
set nowrap

" indentation
set smarttab

" search
set ignorecase
set smartcase
set incsearch
set hlsearch

" bracket matching
set showmatch

" COLOR SCHEMES
set termguicolors
colorscheme onehalflight
" let ayucolor="light"
" colorscheme ayu
" set t_Co=256
" colorscheme Tomorrow


" status bar
set showcmd
set laststatus=2
set statusline=%f\ %(%m%r%h\ %)%([%Y]%)%=\ [b%n]\ %l/%L\ \|%v\|\ ~\ %p\

" completion behaviour
set completeopt=longest,menuone

" spell checking
set spell
set spelllang=en ", es -> cannot set both due E763 error
set spellcapcheck=""  "disable capital spell checks

" highlight spelling mistakes by underlining
hi clear SpellBad
hi SpellBad cterm=underline
hi clear SpellRare
hi SpellRare cterm=underline
hi clear SpellCap
hi SpellCap cterm=underline
hi clear SpellLocal
hi SpellLocal cterm=underline

" visual aid for the 80th column
"set colorcolumn=80

" restore folding status after closing window
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview


" tag navigation (ctags)
setglobal tags=tags,


" ctrlp.options
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,.tool-versions
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]deps|_build|\.(git|hg|svn|sass-cache|)$',
      \ 'file': '\v[\/]tags|\.(exe|so|dll|DS_Store|pyc|beam)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
" Disable caching (fd is fast enough)
let g:ctrlp_use_caching = 1
" Search only by filename (vs. using the entire path)
let g:ctrlp_by_filename = 0
" Wait to finish typing before showing results
let g:ctrlp_lazy_update = 0

if executable('fd')
  " Use fd to navigate files (https://github.com/sharkdp/fd)
  let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
end


" The Silver Searcher (a.k.a ag) customizations
if executable('ag')
  " ack.vim options
  let g:ackprg = 'ag --vimgrep'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --path-to-ignore\ $HOME/.agignore

  " Alias Ack.vim command searches
  cnoreabbrev Ag Ack
  cnoreabbrev ag Ack
end


" airline.vim options
" let g:airline_theme='kalisi'
let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts=1



" MAPPINGS
let mapleader=","

" navigate semantically via ctags
nmap <LEADER>o <C-]>


" HANDLING WINDOWS

" moving between windows
map <LEADER>j <C-w><C-j>
map <LEADER>k <C-w><C-k>
map <LEADER>h <C-w><C-h>
map <LEADER>l <C-w><C-l>

" close window
map <LEADER>x <C-w><C-c>

" change window sizes
map <LEADER>< <C-w><
map <LEADER>> <C-w>>

" rotate window righwards/downwards
map <LEADER>rw <C-w>r

" buffer handling with leader key
map <LEADER>3 :b#<CR>
map <LEADER>X :bd!<CR>

" open nerdtree with leader key
map <LEADER>n :NERDTree<CR>

" ctrlp.vim
map <LEADER>b :CtrlPBuffer<CR>
map <LEADER>f :CtrlPCurFile<CR>

" ack.vim
nnoremap F :Ack <cword><cr>
nnoremap <LEADER>a :Ack<space>

"Clean search
nnoremap <LEADER><space> :noh<CR>

"HANDLING TABS (I use buffers rather than tabs)
"map <LEADER><LEADER>n :tabnew<cr>
"map <LEADER><LEADER>x :tabclose<cr>
"map <LEADER><LEADER>l :tabnext<cr>
"map <LEADER><LEADER>j :tabprev<cr>


"WHOLE FILE KEY BINDINGS
" indent
map <Leader>I mmgg=G`m

" remove trailing whitespaces
map <leader>T  mm\|:%s/\s\s*$//g<cr>\|`m

"re-run last command
map <leader>. :!!<cr>

" RUN TESTS (https://github.com/janko-m/vim-test)
let test#strategy = "vimterminal"
map <leader>r :TestLast<cr>
map <leader>s :TestFile<cr>
map <leader>S :TestNearest<cr>


"REMOVED MAPPINGS

" disble F1 as :h shortchut in all modes
map   <F1>    <nop>
map!  <F1>    <nop>
