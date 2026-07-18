#! /bin/bash

echo Would you like to update Ubuntu?
# Source - https://stackoverflow.com/a/1885534
# Posted by Dennis Williamson, modified by community. See post 'Timeline' for change history
# Retrieved 2026-06-08, License - CC BY-SA 4.0

read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    # do dangerous stuff

sudo apt update -y

fi

echo Would you like to upgrade Ubuntu?

read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

sudo apt-get upgrade -y
