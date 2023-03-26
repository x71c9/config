## Link config file
```bash
ln -s ~/repos/config/.vimrc ~/.vimrc
```

## Link themes
```bash
ln -s ~/repos/config/vim/colors ~/.vim/colors
```

## Create backup dir
```bash
mkdir ~/.vim/.vim_backups/
```

## Install Plugin
```bash
mkdir ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
Inside Vim:
```bash
:PlugInstall
```

## Link coc-config
```bash
ln -s ~/repos/config/vim/coc-settings.json ~/.vim/
```

