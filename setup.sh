#!/bin/sh

NONE='\033[00m'
RED='\033[01;31m'
GREEN='\033[01;32m'
YELLOW='\033[01;33m'
PURPLE='\033[01;35m'
CYAN='\033[01;36m'
WHITE='\033[01;37m'
BOLD='\033[1m'
UNDERLINE='\033[4m'

# chmod +x
echo  "${GREEN}-------------------------- ${NONE}"
echo  "${GREEN}Giving execution permision to provision shellscripts ${NONE}"
echo  "${GREEN}-------------------------- ${NONE}"
chmod +x ./provision/**/*
echo  "${GREEN}DONE ${NONE}"
echo  "${GREEN} ${NONE}"

# Set hostname
echo  "${GREEN}-------------------------- ${NONE}"
echo  "${GREEN}Setting hostname ${NONE}"
echo  "${GREEN}-------------------------- ${NONE}"
sh ./provision/shell/set_hostname.sh
echo  "${GREEN}DONE ${NONE}"
echo  "${GREEN} ${NONE}"


# Install homebrew
echo  "${GREEN}-------------------------- ${NONE}"
echo  "${GREEN}Installing Homebrew ${NONE}"
echo  "${GREEN}-------------------------- ${NONE}"
sh ./provision/shell/brew_install.sh
echo  "${GREEN}DONE ${NONE}"
echo  "${GREEN} ${NONE}"

# Install ansible
echo  "${GREEN}-------------------------- ${NONE}"
echo  "${GREEN}Installing Ansible ${NONE}"
echo  "${GREEN}-------------------------- ${NONE}"
sh ./provision/shell/ansible_install.sh
echo  "${GREEN}DONE ${NONE}"
echo  "${GREEN} ${NONE}"

# Execute ansible playbook.
echo  "${GREEN}-------------------------- ${NONE}"
echo  "${GREEN}Executing ansible playbook ${NONE}"
echo  "${GREEN}-------------------------- ${NONE}"
ansible-playbook  provision/ansible/playbook.yml
echo  "${GREEN} ${NONE}"

# Configuring .zprofile
echo  "${GREEN}-------------------------- ${NONE}"
echo  "${GREEN}Configuring .zprofile ${NONE}"
echo  "${GREEN}-------------------------- ${NONE}"
cp .zprofile ~/
echo  "${GREEN}DONE ${NONE}"
echo  "${GREEN} ${NONE}"