# neovim

My neovim config

## Tutorial

- https://github.com/junegunn/vim-plug

## on windows

1. install the latest version of nvim

  - >  choco install neovim --params "/NeovimOnPathForAll"

2. if *nvim --version* doesn't work add an alias
  
  - copy the profile.ps1 to the powershell directory and edit the path
3. Kill a process
  - > netstat -aof | findstr :3000
  - > taskkill /F /PID 9576
4. set vi-Plugon
  - > iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force


## on linux

```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
ln -s /squashfs-root/AppRun /usr/bin/nvim
nvim --version

```

## SpaceVim

  - > curl -sLf https://spacevim.org/install.sh | bash
