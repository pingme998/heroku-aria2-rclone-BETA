#!/bin/bash
wget $betaVar1 -O /.config/rclone/rclone.conf
rclone version
rclone listremotes > remotesch.txt
sed 's/.$//' remotesch.txt > remotes.txt
while read line
do
   my_var="$my_var, '$line'"
done < remotes.txt

my_var="${my_var#, }"              

echo "$my_var"

OLD=REMOTCLOUD
sed "s|$OLD|$my_var|g" /Aria2Rclone.htpy >/Aria2Rclone.ipynb

jupyter nbextension enable --py widgetsnbextension --sys-prefix
jupyter serverextension enable voila --sys-prefix
curl 'https://raw.githubusercontent.com/developeranaz/Aria2-Rclone-Remote-Uploader-HEROKU/main/Essential-Files/d/donate.developeranaz.txt'
voila --port=$PORT --no-browser  /Aria2Rclone.ipynb --theme=dark
#jupyter notebook --ip=0.0.0.0 --port=$PORT --NotebookApp.token='' --NotebookApp.password=''
