source ~/.vim/plugins.vim

" set mouse support
set ttyfast
set mouse=a
" Only for vi and vim (not neovim)
" set ttymouse=xterm2

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

" show unwanted whitespaces 
set listchars=tab:⊢-→,trail:,nbsp:,extends:↲
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
" https://github.com/sonph/onehalf/blob/master/vim/README.md
set t_Co=256
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme onehalflight

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


" The Silver Searcher (a.k.a ag) customizations
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --path-to-ignore\ $HOME/.agignore

  " Use ag to consume fzf output (and respect .gitignore)
  let $FZF_DEFAULT_COMMAND = 'ag -g ""'
  command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)
  command! -nargs=+ -complete=file Rag call fzf#vim#ag_raw(<q-args>)
end


" NERDTree Settings
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['node_modules']
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" airline.vim options
let g:airline_theme='onehalfdark'
let g:airline_powerline_fonts=1

" matchup.vim config
let g:matchup_matchparen_offscreen = {}


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

" fzf and fzf.vim
map <LEADER>t :FZF<CR>
map <LEADER>b :Buffers<CR>
nnoremap F :Ag <C-r><C-w><CR>
nnoremap <LEADER>a :Ag<space>

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
