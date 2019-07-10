#Flags
# MSY_NEED_UPDATE=false
# if [[ $OSTYPE == darwin* ]] ; then MSY_IS_OSX=true; else MSY_IS_OSX=false; fi
# touch ~/.devEnvLastUpdate
# NOW=$(date +%s)
# DIFF=$(expr $NOW - $(cat ~/.devEnvLastUpdate)) || echo 0
# echo diff $DIFF
# if [[ DIFF -gt 604800 ]]
# then
#     echo "Do you wish to update development environments?"
#     select yn in "Yes" "No"; do
#         case $yn in
#             Yes ) MSY_NEED_UPDATE=true; break;;
#             No ) break;;
#         esac
#     done
# fi
# echo $NOW > ~/.devEnvLastUpdate

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$PATH:$ANDROID_HOME/tools\
:$ANDROID_HOME/platform-tools\
:$HOME/.rvm/bin\
:$HOME/sdks/flutter/bin"
export NVM_DIR="$HOME/.nvm"

# brew
if $MSY_IS_OSX && $MSY_NEED_UPDATE; then
    logYellow "Updating Homebrew..."
    brew update
    brew upgrade
    brew list
fi

# node
logYellow "Loading nvm..."
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"                           # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion" # This loads nvm bash_completion
if $MSY_NEED_UPDATE; then
    logYellow "Updating node and npm..."
    nvm install 10
    npm install -g \
        eslint \
        lr-http-server \
        nodemon \
        npm \
        npm-check-updates \
        react-native-cli \
        react-native-create-library \
        ts-node \
        typescript \
        yarn
    ncu --global
fi
versionCheck node $(node --version) $(which node)
versionCheck npm $(npm --version) $(which npm)
versionCheck yarn $(yarn --version) $(which yarn)

# python
alias python=python3
alias pip=pip3
if $MSY_NEED_UPDATE; then
    pip install --upgrade pip
    pip install --upgrade pipenv
fi
versionCheck python $(python --version | awk -F ' ' '{print $2}') $(which python3)
MSY_PIP_RAWSTRING="$(pip --version)"
MSY_PIP_VERSION="$(echo $MSY_PIP_RAWSTRING | awk -F ' ' '{print $2}')"
MSY_PIP_PATH="$(echo $MSY_PIP_RAWSTRING | awk -F ' ' '{print $4}')"
versionCheck pip $MSY_PIP_VERSION $MSY_PIP_PATH

# ruby
# versionCheck ruby `ruby --version| awk -F ' ' '{print $2}'` `which ruby`
# versionCheck gem `gem --version` `which gem`

# xcode-select
if $MSY_IS_OSX; then
    MSY_XCODE_VERSION="$()"
    versionCheck xcode $(xcodebuild -version | head -n 1 | awk -F ' ' '{print $2}') $(xcode-select -p)
    if $MSY_NEED_UPDATE; then sudo gem update cocoapods; fi
    versionCheck cocoapods $(pod --version) $(which pod)
fi

# java
if $MSY_IS_OSX; then export JAVA_HOME=$(/usr/libexec/java_home); fi
versionCheck java $(java -version 2>&1 | head -n 1 | awk -F '"' '{print $2}') $JAVA_HOME

(
    IFS=$'\n'
    echo "${DEV_ENV_PASSED_CHECKS[*]}"
)

# ## set title
# ttitle() { echo -ne "\e]1;$@\a" }

# ## current folder as title
# function chpwd { ttitle "$(basename "$PWD")" }
# ttitle "$(basename "$PWD")"

function versionCheck() {
    # $1 - name, $2 - version, $ - path
    local COND=true
    case $1 in
    "node") COND="$MSY_NODE_VERSION == v10.*" ;;
    "java") COND="$MSY_JAVA_VERSION == 1.8.*" ;;
    esac

    local OUTPUT="$(printf %-10s $1)\t$(printf %-20s $2)\t$3"
    if [[ $COND ]]; then
        DEV_ENV_PASSED_CHECKS+=($OUTPUT)
    else
        DEV_ENV_FAILED_CHECKS+=($OUTPUT)
    fi
}
