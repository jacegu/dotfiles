
# Make fish the default shell
set -xU SHELL (which fish);

# Prefer US English and use UTF-8
set -x LANG        "en_US.UTF-8";
set -x LC_ALL      "en_US.UTF-8";
set -x LC_NUMERIC  "es_ES.UTF-8";
set -x LC_MONETARY "es_ES.UTF-8";
set -x LC_DATE     "es_ES.UTF-8";

# Highlight section titles in manual pages
set -x LESS_TERMCAP_md (set color magenta);

# Disable history for less
set -x LESSHISTFILE /dev/null

# Don’t clear the screen after quitting a manual page
set -x MANPAGER "less -X";

# gnupg settings
set -x GPG_TTY (tty)


# Make nvim the default editor
set -x EDITOR "nvim";
set -x VISUAL "nvim";

# Set Bat theme (https://github.com/sharkdp/bat)
set -x BAT_THEME "OneHalfLight";
