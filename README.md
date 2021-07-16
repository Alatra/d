# Setup

## Vim-plug https://github.com/junegunn/vim-plug

``` sh
sudo pacman -S curl
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

:PlugInstall </br>

## Python

``` sh
sudo pacman -S python-pip
sudo pacman -S python2-pip
pip install neovim --user
pip2 install neovim --user
```

# Plugin configuration
## Telescope https://github.com/nvim-telescope/telescope.nvim

``` sh
sudo pacman -S ripgrep
```

## Nvim-lsp https://github.com/neovim/nvim-lspconfig

### Python lsp

``` sh
npm i -g pyright
```

# Theme

## Tokyonight https://github.com/folke/tokyonight.nvim
