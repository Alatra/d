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

### Lua lsp https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)

``` sh
sudo pacman -S ninja
cd ~/.config/nvim
mkdir lsp
cd lsp
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive

cd 3rd/luamake
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
```

### Cpp lsp

``` sh
sudo pacman -S llvm
```

# Theme

## Tokyonight https://github.com/folke/tokyonight.nvim
