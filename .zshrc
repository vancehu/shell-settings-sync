export ZSH="$HOME/.oh-my-zsh"
function logYellow() { echo  -e "\u001b[33m$1\u001b[0m" }
function logCyan() { echo  -e "\u001b[36m$1\u001b[0m" }
DEV_ENV_PASSED_CHECKS=()
DEV_ENV_FAILED_CHECKS=()

#Flags
MSY_NEED_UPDATE=false
if [[ $OSTYPE == darwin* ]] ; then MSY_IS_OSX=true; else MSY_IS_OSX=false; fi
touch ~/.devEnvLastUpdate
NOW=$(date +%s)
DIFF=$(expr $NOW - $(cat ~/.devEnvLastUpdate)) || echo 0
echo diff $DIFF
if [[ DIFF -gt 604800 ]]
then 
    echo "Do you wish to update development environments?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) MSY_NEED_UPDATE=true; break;;
            No ) break;;
        esac
    done
fi
echo $NOW > ~/.devEnvLastUpdate

#Scripts
source ~/.settings-sync/local/init.sh
source ~/.settings-sync/devEnvSetup.sh
source ~/.settings-sync/local/afterDevEnvSetup.sh
source ~/.settings-sync/helpers.sh
source ~/.settings-sync/local/afterHelpers.sh
source ~/.settings-sync/zshSetup.sh
source ~/.settings-sync/local/afterZshSetup.sh

# #THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="/Users/vance.hu/.sdkman"
# [[ -s "/Users/vance.hu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/vance.hu/.sdkman/bin/sdkman-init.sh"
