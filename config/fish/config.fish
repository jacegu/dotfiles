# Enable Vi mode
fish_vi_key_bindings

# Setup Homebrew
# this comes from the setup on the M1
# eval (/opt/homebrew/bin/brew shellenv)

# Setup Jump (https://github.com/gsamokovarov/jump)
if type -q "jump"
  status --is-interactive; and source (jump shell --bind=t fish | psub)
end

# Setup direnv (https://direnv.net/)
# https://direnv.net/docs/hook.html#fish
if type -q "direnv"
  eval (direnv hook fish)
end

# Setup asdf (https://asdf-vm.com)
# https://asdf-vm.com/#/core-manage-asdf-vm?id=install-asdf-vm
if type -q "asdf"
  source (brew --prefix asdf)/asdf.fish
end

# Setup Google Cloud Platform SDK
if test -e /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
  source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
end

# Enabling yarn global
if type -q "yarn"
  fish_add_path (yarn global bin)
end


source $HOME/.config/fish/exports.fish
source $HOME/.config/fish/aliases.fish
