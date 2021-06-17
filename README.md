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

## Denite https://github.com/Shougo/denite.nvim

``` sh
pip3 install --user pynvim
sudo pacman -S ripgrep

```

# Not use anymore 

## Coc https://github.com/neoclide/coc.nvim

``` sh
sudo pacman -S nodejs yarn npm
sudo npm install -g neovim
```

:CocInstall coc-lists coc-snippests coc-yank coc-json coc-tslint-plugin coc-html coc-tsserver coc-htm coc-css </br>
(:CocInstall coc-python coc-solargraph) </br>

## Ack

``` sh
sudo pacman -S ack
```


## Haskell-ide-engine https://github.com/haskell/haskell-ide-engine

``` sh
sudo pacman -S stack
sudo pacman -S ghc
git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules
cd haskell-ide-engine
stack ./install.hs help
stack ./install.hs hie-8.x.x
stack ./install.hs build-data
 ```
