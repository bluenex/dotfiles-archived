# DOTFILES COLLECTION

## INTRO
There are a lot of dotfiles (a.k.a configuration files) that I have used to config things for my convenient. Whenever I had to move to another PC life is just getting harder, so the backup of dotfiles began. At first I've used Github gist to collect these files but when there were often changes, the task became tedious. 

I've been thinking about making a dedicated repo but there are too many different paths to each of them so the idea has been postponed for pretty long time. Recently, I had to work a bit with crontab and thought it would help and yeah finally my version of dotfiles auto backup becomes real! 

Just when I'm writing this readme, I've just discovered this [dotfiles guide](https://dotfiles.github.io/) otherwise I probably would have got more to put in my repo. 

## STRUCTURE
This repo is not yet very complex as seen in [this site](https://dotfiles.github.io/). Just a copies of files and directory, nothing more. The copy is done by shell script and schedule by crontab (script itself is also copied) and will be automatically pushed to Github repo once a month. By now the dotfiles included
- zshrc
- jupyter setting (just auto open browser off..)
- tmux config and last resurrect save
- vim
- ssh config (had to redirect port to 443 because 22 is blocked)
- vscode (just one line though..)
- hammerspoon (forked from someone I stared on Github)
- shell scripts for crontab

## TODO (NOT THIS SOON)
- Restoration script
- Packages installation script
