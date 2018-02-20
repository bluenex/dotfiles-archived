#### This script is used to backup every needed dotfiles on my system.
#### Procedure is straight-forward, just collect all path to dotfiles in variables 
#### and copy them to target folder, in this case is my git repo for dotfiles. 
#### After finishing the copy, git push will be called.
#### Note that this script is intent to call by cronjob every month.

#### variables
backupdot_logf=~/autobackupdot.log
backup_path=~/LocalProjects/dotfiles
zsh=~/.zshrc
custom=~/.custom-bash
jupyter=~/.jupyter/jupyter_notebook_config.py
tmuxconf=~/.tmux.conf
tmuxlast=~/.tmux/resurrect/last
vim=~/.vimrc
vimlocal=~/.vimrc.local
vimbundle=~/.vimrc.bundles.local
sshproxy=~/.ssh/config
vscode=~/.vscode/settings.json
cron_autoupdate=~/cron_autoupdate.sh
cron_backupdotfiles=~/cron_backupdotfiles.sh
hammerspoon=~/.hammerspoon
ohmyzshcustomtheme=~/.oh-my-zsh/custom/themes/dpoggi-timestamp.zsh-theme

#### copy function
## log copy result to the log file 
cpfile() {
  cp $1 $backup_path/$(basename $1)
  if [ $? -ne 0 ]
  then
      echo "$(basename $1) was not copied with the error code $?" >> $backupdot_logf
  else
      echo "$(basename $1) was successfully copied to $backup_path/$(basename $1)" >> $backupdot_logf
  fi
}

cpdir() {
  if [ ! -d $backup_path/$(basename $1) ]
  then
    mkdir $backup_path/$(basename $1)
  fi

  cp -r $1/* $backup_path/$(basename $1)

  if [ $? -ne 0 ]
  then
      echo "$(basename $1) was not copied with the error code $?" >> $backupdot_logf
  else
      echo "$(basename $1) was successfully copied to $backup_path/$(basename $1)" >> $backupdot_logf
  fi
}

## echo results of copying to log file 
echo $(date) >> autobackupdot.log
echo "============ SHELL ENV ============" >> $backupdot_logf
cpfile $zsh
cpfile $custom
echo "============= JUPYTER =============" >> $backupdot_logf
cpfile $jupyter
echo "============== TMUX ===============" >> $backupdot_logf
cpfile $tmuxconf
cpfile $tmuxlast
echo "=============== VIM ===============" >> $backupdot_logf
cpfile $vim
cpfile $vimlocal
cpfile $vimbundle
echo "=============== SSH ===============" >> $backupdot_logf
cpfile $sshproxy
echo "============= VSCODE ==============" >> $backupdot_logf
cpfile $vscode
echo "============== CRON ===============" >> $backupdot_logf
cpfile $cron_autoupdate
cpfile $cron_backupdotfiles
echo "=========== HAMMERSPOON ===========" >> $backupdot_logf
cpdir $hammerspoon
echo "========== OHMYZSH THEME ==========" >> $backupdot_logf
cpfile $ohmyzshcustomtheme
echo "========== PUSH TO GITHUB =========" >> $backupdot_logf
## push to git repo 
cd $backup_path
git add -A && git commit -m "monthly commit of $(date "+%B")" | tee -a $backupdot_logf
git push origin master | tee -a $backupdot_logf 
cd ~
echo "###################################" >> $backupdot_logf
echo "###################################" >> $backupdot_logf
echo >> $backupdot_logf

