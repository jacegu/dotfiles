
# Make fish the default shell
set -gx SHELL (which fish);

# Make nvim the default editor
set -gx EDITOR "nvim";
set -gx VISUAL "nvim";


# Prefer US English and use UTF-8
set -gx LANG        "en_US.UTF-8";
set -gx LC_ALL      "en_US.UTF-8";
set -gx LC_NUMERIC  "es_ES.UTF-8";
set -gx LC_MONETARY "es_ES.UTF-8";
set -gx LC_DATE     "es_ES.UTF-8";

# Highlight section titles in manual pages
set -x LESS_TERMCAP_md (set color magenta);

# Disable history for less
set -x LESSHISTFILE /dev/null

# Don’t clear the screen after quitting a manual page
set -x MANPAGER "less -X";
