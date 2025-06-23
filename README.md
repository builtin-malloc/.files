# .files

My configuration files for a Linux/MacOS system.

## Install

The following installs the basic software needed for these dotfiles and sets up the system.

```sh
cd
mkdir Programs Libraries Repos

sudo apt install git make neovim tmux zsh
sudo apt install eza bat ripgrep btop zoxide
sudo apt install zsh-syntax-highlighting zsh-autosuggestions
chsh -s $(which zsh)

git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim

git clone git@github.com:builtin-malloc/.files.git Repos/Dotfiles
cd Repos/Dotfiles
make install
```
