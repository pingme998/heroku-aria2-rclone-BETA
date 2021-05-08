#!/bin/bash


rclone version
rclone listremotes > remotes.txt


while read line
do
   my_var="$my_var, '$line'"
done < remotes.txt

my_var="${my_var#, }"              

echo "$my_var"



OLD=REMOTCLOUD
sed "s|$OLD|$my_var|g" /Essential-Files/Aria2Rclone.ipynb>Aria2Rclone.ipynb

jupyter nbextension enable --py widgetsnbextension --sys-prefix
jupyter serverextension enable voila --sys-prefix
curl 'https://raw.githubusercontent.com/developeranaz/Aria2-Rclone-Remote-Uploader-HEROKU/main/Essential-Files/d/donate.developeranaz.txt'
voila --port=$PORT --no-browser  Aria2Rclone.ipynb --theme=dark
