# .files

My configuration files for a Linux/MacOS system.

## Install

The following installs the basic software needed for these dotfiles and sets up the system.

```sh
sudo apt update
sudo apt upgrade

sudo apt install git make tmux zsh
sudo apt install eza bat ripgrep btop zoxide
sudo apt install zsh-syntax-highlighting zsh-autosuggestions
sudo snap install nvim --classic

chsh -s $(which zsh)

git clone https://github.com/folke/lazy.nvim.git ~/.local/share/nvim/lazy/lazy.nvim

cd
mkdir Programs Libraries Repos
git clone git@github.com:builtin-malloc/.files.git Repos/Dotfiles
cd Repos/Dotfiles
make install
```
