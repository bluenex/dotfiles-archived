#### This script is used to update brew and conda regularly

#### variables
autoupdate_logf=~/autoupdate.log

echo $(date) >> $autoupdate_logf
echo "========= BREW UPDATE =========" >> $autoupdate_logf
brew update | tee -a $autoupdate_logf
echo "========= BREW UPGRADE ========" >> $autoupdate_logf
brew upgrade | tee -a $autoupdate_logf
echo "============ CONDA ============" >> $autoupdate_logf
conda update -y conda | tee -a $autoupdate_logf
echo "###############################" >> $autoupdate_logf 
echo "###############################" >> $autoupdate_logf 
echo >> $autoupdate_logf 
