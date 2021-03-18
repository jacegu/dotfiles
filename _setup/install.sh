#!/usr/bin/env bash

# Target directory where to install the dotfiles.
# Defaults to $HOME but can be changed for testing purposes.
TARGET=$HOME

# These are the files and directories that will be
# linked in the $TARGET directory.
PATHS=(
config
curlrc
gemrc
gitconfig
githooks
gitignore
gvimrc
hushlogin
irbrc
#osx
screenrc
tool-versions
vim
vimrc
wgetrc
)

function _setupLink() {
  source=$1
  target=$2
  file=$3

  # Target exists and is identical to source
  if [ $target -ef $source ]
  then
    echo "✅ $target -> $file (already linked)"
  # Target exists but is different from source
  elif [ -f $target -o -d $target ]
  then
    read -p "⚠️ $target exists. Replace? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      rm -rf $target
      ln -s $source $target
      echo "✴️ $target -> $file (replaced)"
    else
      echo "⛔️ $target -> $file (skipped)"
    fi
  # Target doesn't exist
  else
    ln -s $source $target
    echo "✳️ $target -> $file (linked)"
  fi
}


function setupLinks() {
  for file in ${PATHS[*]}
  do
    target=$TARGET/.$file
    source=$PWD/$file
    _setupLink $source $target $file
  done
}


function setLoginShell() {
  fish_path=$(which fish);

  # When fish shell is not the default shell
  if [ "$SHELL" != $fish_path ]
  then
    allowed_shells=$(sudo cat /etc/shells);

    # When fish shell is not an allowed shell: allow it
    if [ $(echo $allowed_shells | grep -c $fish_path) -eq 0 ]
    then
      sudo sh -c "echo $fish_path >> /etc/shells"
      echo "✅ $fish_path added to /etc/shells"
    else
      echo "✅ $fish_path already present int /etc/shells"
    fi

    chsh -s `which fish` && echo "✅ $fish_path set as the login shell"
  else
    echo "✅ $fish_path is already the default shell"
  fi
}


function setupBrew() {
  if [ ! -f `which brew` ]
  then
    echo "✳️  Installing Brew..."
    # https://brew.sh
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  else
    echo "✅ Brew already installed"
  fi
}

function setupBrewBundle() {
  _setupLink $PWD/Brewfile $TARGET/Brewfile Brewfile
  read -p 'Run `brew bundle`? [y/n] ' -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    brew bundle
    echo '✅ `brew bundle` run'
  else
    echo '✅ "Skipping `brew bundle`...'
  fi
}

function setupVim() {
  if [ ! -d "vim/autoload/plug.vim" ]
  then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "✅ Plug.vim installed via curl"
    vim +PlugInstall +qall!;
    echo "✅ :PlugInstall successufully completed"
  else
    echo "✅ Vim has already been setup"
  fi
}



echo
echo "0️⃣ Setting up dotfiles as symlinks"
setupLinks;
echo
echo "1️⃣ Setting up Fish as the login shell"
setLoginShell;
echo
echo "2️⃣ Setting up Brew"
setupBrew;
setupBrewBundle;
echo
echo "3️⃣ Setting up Vim"
setupVim;


unset FILES;
unset _setupLink;
unset setLoginShell;
unset setupBrew;
unset setupBrewBundle;
unset setupVim;
