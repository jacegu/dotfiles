setlocal expandtab
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

" Automatically fold comments in Ruby files
setlocal foldmethod=expr
setlocal foldexpr=getline(v:lnum)=~'^\\s*#'

let test#ruby#rspec#options = '--color --format documentation --no-profile'

" run as ruby file
map <leader><cr> :!clear; ruby %<cr>
