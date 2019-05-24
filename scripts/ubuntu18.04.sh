#!/bin/bash
# If I wasn't, then why would I say I am..

# where am i? move to where I am. This ensures source is properly sourced
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
# move back to install root
cd ../

# Color. The vibrant and dancing melody of the sighted.
# provide messaging colors for output to console
txtbld=$(tput bold)             # BELIEVE ME. Bold.
bldgrn=$(tput setaf 2) #  WOOT. Green.
bldred=${txtbld}$(tput setaf 1) # Booooo get off the stage. Red.
txtreset=$(tput sgr0) # uhhh what?

# cave....cave....c a ve... c      a     v         e  ....
haxecho(){
  echo "${bldgrn}$1${txtreset}"
}
# EVERYTHING IS ON FIRE
haxwarn(){
  echo "${bldred}$1${txtreset}"
}
# Create a unik, uneek, unqiue id.
getuuid(){
  echo $(cat /proc/sys/kernel/random/uuid)
}
echo "alias g='git'" >> $HOME/.bashrc
echo "alias l='ls -laHF'" >> $HOME/.bashrc
source $HOME/.bashrc
# install php and other important things
sudo apt-get install -y php7.2-fpm php7.2-zip php7.2-gd php-dom git
# optional for development
# sudo apt-get install -y composer nodejs
sudo a2enmod proxy_fcgi
sudo a2enconf php7.2-fpm
sudo a2dismod php7.2
sudo a2dismod mpm_prefork
sudo a2enmod mpm_event
sudo a2enmod http2
# enable protocol support
echo "Protocols h2 http/1.1" > /etc/apache2/conf-available/http2.conf
sudo a2enconf http2
# performance bulk we apply all the time
sudo cp zzz-performance.conf /etc/apache2/conf-available/zzz-performance.conf
sudo a2enconf zzz-performance
# get this party started
sudo service apache2 restart