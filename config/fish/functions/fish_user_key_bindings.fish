
function fish_user_key_bindings

  # CTRL+u behaves as up arrow
  bind -M insert \cU history-search-backward
  bind -M normal \cU history-search-backward

  # CTRL+e opens editor to edit the command at hand
  bind -M insert \cE edit_command_buffer
  bind -M normal \cE edit_command_buffer

end
