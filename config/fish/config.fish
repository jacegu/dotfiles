source $HOME/.config/fish/exports.fish
source $HOME/.config/fish/aliases.fish

# Enable Vi mode
fish_vi_key_bindings

# Setup Jump (https://github.com/gsamokovarov/jump)
status --is-interactive; and source (jump shell --bind=t fish | psub)

# Setup direnv (https://direnv.net/)
# https://direnv.net/docs/hook.html#fish
eval (direnv hook fish)

# Setup asdf (https://asdf-vm.com)
# https://asdf-vm.com/#/core-manage-asdf-vm?id=install-asdf-vm
source /usr/local/opt/asdf/asdf.fish

# PATH customization
# Setup Postgres.app to be used from the CLI
fish_add_path "/Applications/Postgres.app/Contents/Versions/latest/bin"

# Enabling yarn global
if test -f (which yarn)
  fish_add_path (yarn global bin)
end

# Go PATH
set -x GOPATH "$HOME/go"
fish_add_path "$GOPATH/bin"
