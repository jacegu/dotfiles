
function fish_user_key_bindings

  # CTRL+u behaves as up arrow
  bind -M insert \cU history-search-backward
  bind -M normal \cU history-search-backward

end
