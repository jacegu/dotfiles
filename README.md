# jacegu's dotfiles

![Screenshot of my shell prompt](https://cl.ly/2N1M2i1v000C/my-fish-terminal-prompt.png)

I created this because I couldn't achieve what I wanted with my previous dotfiles repo.
- I wanted to treat my dotfiles as any other code repository (and have it in `~/Dev`).
- I wanted for all changes I made in ~/.anyfile to be reflected in the dotfiles repo.
- I didn't want to make my ~ dir a git repo.
- I wanted something simpler than existing solutions, like `[homesick](https://github.com/technicalpickles/homesick)`.

## Installation

```bash
git clone && cd dotfiles && ./_setup/install.sh
```

All the magic happens in `_setup/install.sh`. This bash script will:
- Setup the dotfiles in `~` as symlinks to the files in the repo
- Setup fish as the login shell.
- Setup Vim and the corresponding plugins.
- Setup Brew, Brew Cask, Brew Bundle and install the corresponding formulae.

The installation script will consider existing files and warn you about them. It is also designed so it can be run as as many times as necessary, considering steps of the setup that have already been completed.

---

## Author

### Thanks to…

This is a fork of [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles) that I have been customizing over time. Installation instructions and the rest of the README won't be modified unless I add something different.

| [![twitter/mathias](http://gravatar.com/avatar/24e08a9ea84deb17ae121074d0f17125?s=70)](http://twitter.com/mathias "Follow @mathias on Twitter") |
|---|
| [Mathias Bynens](https://mathiasbynens.be/) |
