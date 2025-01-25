# to give light binary permission running without sudo
echo "enter light binary path (e.g. /usr/bin/light)"
read path
sudo chmod u+s $path
