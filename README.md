# dotvim
My [dot]vim director, including vimrc config file

###To setup Vim on new machine:
```bash
cd ~
git clone https://github.com/vuonghv/dotvim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc
cd ~/.vim
git submodule init
git submodule update
```

###To upgrade all plugins:
```bash
git submodule foreach git pull origin master
```

###To install plugins as submodules
```bash
cd ~/.vim
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```
