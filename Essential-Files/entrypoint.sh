#!/bin/bash
wget 'https://gist.githubusercontent.com/developeranaz/fb2150cc762fcdb7045dfe83a1439de3/raw/9a80dfaed40e9120a75513b1a1eb9d90f0914bf3/rclon.conf' -O /.config/rclone/rclone.conf
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
#voila --port=$PORT --no-browser  /Aria2Rclone.ipynb --theme=dark
jupyter notebook --ip=0.0.0.0 --port=$PORT --NotebookApp.token='' --NotebookApp.password=''
