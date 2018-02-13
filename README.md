# jacegu's dotfiles

![Screenshot of my shell prompt](https://cl.ly/302h1D2d0e3z/my-fish-terminal-prompt.png)

I created this because I couldn't achieve what I wanted with my previous dotfiles repo.
- I wanted to treat my dotfiles as any other code repository (and have it in `~/Dev`).
- I wanted for all changes I made in `~/.anyfile` to be reflected in the dotfiles repo.
- I didn't want to make my `~` a git repo.
- I wanted something simpler than existing solutions, like [`homesick`](https://github.com/technicalpickles/homesick).

## Installation

```bash
git clone https://github.com/jacegu/dotfiles.git && cd dotfiles && ./_setup/install.sh
```

All the magic happens in `_setup/install.sh`. This bash script will:
- Setup the dotfiles in `~` as symlinks to the files in the repo
- Setup fish as the login shell.
- Setup Vim and the corresponding plugins.
- Setup Brew, Brew Cask, Brew Bundle and install the corresponding formulae.

The installation script will consider existing files and warn you about them. It is also designed so it can be run as as many times as necessary, considering steps of the setup that have already been completed.

### Other `_setup` content

The `_setup` dir also includes the following:
- My iTerm 2 preferences. I set it up so they are saved here and keep them under version control:
  ![iTerm preferences](https://cl.ly/0m3x271H022m/iterm-preferences.png)
- Tomorrow Morning color scheme for iTerm2. [See the original repo](https://github.com/chriskempson/tomorrow-theme). This is also the one I use with vim.
- [Inconsolata font](http://levien.com/type/myfonts/inconsolata.html).


## Author

[Javier Acero](https://javieracero.com)

### Thanks to…

I originally forked my dotfiles repo of [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles) by [Mathias Bynens](https://mathiasbynens.be/) and started to customize it. When I switched to 🐟 shell I decided to start from scratch and deleted pretty much everything. There are still some useful aliases and git settings that I have ported over, so I want to give credit where it's due.
