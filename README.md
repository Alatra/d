## Vim-plug https://github.com/junegunn/vim-plug
sudo pacman -S curl </br>
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim </br>

:PlugInstall </br>
 
## Python 
sudo pacman -S python-pip </br>
sudo pacman -S python2-pip </br>
pip install neovim --user </br>
pip2 install neovim --user </br>

## Coc https://github.com/neoclide/coc.nvim
sudo pacman -S nodejs yarn npm </br>
sudo npm install -g neovim </br>

:CocInstall coc-lists coc-snippests coc-yank coc-json coc-tslint-plugin coc-html coc-tssserver coc-htm coc-css  </br>
(:CocInstall coc-python coc-solargraph) </br>

## Command-T https://github.com/wincent/command-t

TODO </br>

## Ack
sudo pacman -S ack </br>

## Haskell-ide-engine https://github.com/haskell/haskell-ide-engine
sudo pacman -S stack </br>
sudo pacman -S ghc </br>
git clone https://github.com/haskell/haskell-ide-engine --recurse-submodules </br>
cd haskell-ide-engine </br>
stack ./install.hs help </br>
stack ./install.hs hie-8.x.x </br>
stack ./install.hs build-data </br>
