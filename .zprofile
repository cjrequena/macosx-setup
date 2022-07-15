source ~/.bash_profile

# aliases
alias sf='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hf='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew"
alias brewery='brew update && brew upgrade && brew cleanup'
alias ll='ls -l'
alias docker-reset='docker stop $(docker ps -aq) && docker rm $(docker ps -aq) && docker rmi $(docker images -q) && docker system prune && docker system prune --volumes && docker network prune'

# 
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# maven
export MAVEN_HOME=/Users/cjrequena/Development/Tools/apache-maven-3.6.3
export PATH=$PATH:$MAVEN_HOME/bin

# jenv - http://www.jenv.be/
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# pyenv -  https://github.com/pyenv/pyenv
if which pyenv > /dev/null; then eval "$(pyenv init - pyenv init --path)"; fi

# pyenv-virtualenv
eval "$(pyenv virtualenv-init -)" #

# rbenv - https://github.com/rbenv/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi # for rbenv
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# node
export NVM_DIR="$HOME/.nvm"
NVM_HOMEBREW="/usr/local/opt/nvm/nvm.sh"
[ -s "$NVM_HOMEBREW" ] && \. "$NVM_HOMEBREW"
#. "$(brew --prefix nvm)/nvm.sh"
[ -x "$(command -v npm)" ] && export NODE_PATH=$NODE_PATH:`npm root --location=global`

# ----------------------------------------------------------------
if [ -f $(brew --prefix)/etc/grc.bashrc ]; then
  . $(brew --prefix)/etc/grc.bashrc
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [[ $# -eq 0 ]]
then
{

HOSTNAME=$(scutil --get ComputerName)

# Define Variable greeting
greeting=("Greetings Carlos... " "Welcome Carlos... " "Hi Carlos... ")

# Define Variable index
index=$(( RANDOM % ${#greeting[@]} ))
echo ${greeting[${index}]}

# Define Variable tecreset
tecreset=$(tput sgr0)

# Check Logged In Users
who>/tmp/who
echo -e "Logged In users:" $tecreset && cat /tmp/who

# Check hostname
echo -e "Hostname:"$tecreset $HOSTNAME

# Check if connected to Internet or not
ping -c 1 google.com &> /dev/null && echo -e "Internet:$tecreset Connected" || echo -e "Internet:$tecreset Disconnected"

# Check Internal IP - Wired
internalip=$(ipconfig getifaddr en1 || echo none)
echo -e "Internal IP (wired):"$tecreset $internalip

# Check Internal IP - Wifi
internalipwifi=$(ipconfig getifaddr en0 || echo none)
echo -e "Internal IP (wifi):"$tecreset $internalipwifi

# Check External IP
externalip=$(curl -s ipecho.net/plain;echo)
echo -e "External IP: $tecreset"$externalip

# Check System Uptime
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo -e "System Uptime Days:" $tecreset $tecuptime

# Unset Variables
unset greeting index tecreset os architecture kernelrelease internalip externalip nameserver loadaverage

}
fi
# ----------------------------------------------------------------
