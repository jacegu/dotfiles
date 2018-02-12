# https://github.com/VundleVim/Vundle.vim/wiki#i-dont-use-a-posix-shell-ie-bashsh
function vundle
  set -lx SHELL (which sh)
  vim +BundleInstall! +BundleClean +qall
end
