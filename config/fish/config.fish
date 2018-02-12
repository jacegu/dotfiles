
source $HOME/.config/fish/exports.fish
source $HOME/.config/fish/aliases.fish

# Enable Vi mode
fish_vi_key_bindings

# Setup Jump (https://github.com/gsamokovarov/jump)
status --is-interactive; and . (jump shell --bind=t | psub)

# Setup chruby-fish (https://github.com/JeanMertz/chruby-fish)
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
