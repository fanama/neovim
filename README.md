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
## SpaceVim

  - > curl -sLf https://spacevim.org/install.sh | bash
