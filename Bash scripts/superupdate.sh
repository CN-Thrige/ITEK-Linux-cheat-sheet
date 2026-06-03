#! /bin/bash 

echo Would you like to update Ubuntu?

sudo apt update -y

echo Would you like to upgrade Ubuntu?

sudo apt-get upgrade -y

echo  update and remove some packages

sudo apt-get dist-upgrade -y

echo would you like to remove junk?

sudo apt autoremove -y

echo rebooting... rebooting

sudo shutdown -r 0

