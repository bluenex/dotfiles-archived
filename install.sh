if [[ "$OSTYPE" == "linux"* ]]; then
  # Linux
  echo "Linux detected, running script..."
  sudo apt-get install zsh # Zsh
  chsh -s /usr/bin/zsh # set default shell (need to set in terminal manually again)
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # Oh-My-Zsh
  sudo apt-get install tmux # tmux
  sudo apt-get install xclip # make pbcopy derived from mac usable
  sudo apt-get install vim # vim
  curl http://j.mp/spf13-vim3 -L -o - | sh # spf13
  sudo pip install --upgrade youtube-dl
elif [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  echo "Mac OSX detected, running script..."
  brew install zsh # Zsh
  chsh -s /bin/zsh # # set default shell (need to set in terminal manually again)
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # Oh-My-Zsh
  brew install tmux # tmux
  brew install reattach-to-user-namespace # tmux patch
  brew install vim # editor
  curl http://j.mp/spf13-vim3 -L -o - | sh # spf13
  brew install youtube-dl # add-on
elif [[ "$OSTYPE" == "cygwin" ]]; then
  # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
  # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
else
  # Unknown.
  echo "unknown OS detected, please install manually"
fi
