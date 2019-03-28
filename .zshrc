# envs
export ZSH="$HOME/.oh-my-zsh"
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$PATH\
:$ANDROID_HOME/tools\
:$ANDROID_HOME/platform-tools\
:$HOME/.rvm/bin\
:/usr/local/opt/php@7.0/sbin\
:/usr/local/opt/php@7.0/bin"

# alias
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias btool="~/workspace/btool/btool.js"

# functions
## vscode
code () { VSCODE_CWD="$PWD"; open -n -b "com.microsoft.VSCode" --args $* }

## nvm lazy loading 
nvm() { 
  unset -f nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion
  nvm "$@"
}

node() {
  unset -f node
  export NVM_DIR=~/.nvm
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  node "$@"
}
 
npm() {
  unset -f npm
  export NVM_DIR=~/.nvm
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  npm "$@"
}

## set title
ttitle() { echo -ne "\e]1;$@\a" }

## current folder as title
function chpwd { ttitle "$(basename "$PWD")" }
ttitle "$(basename "$PWD")"


ZSH_THEME="powerlevel9k/powerlevel9k"
DISABLE_AUTO_TITLE="true"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir node_version vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs time)
POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
POWERLEVEL9K_NODE_VERSION_FOREGROUND='002'
POWERLEVEL9K_NODE_VERSION_BACKGROUND='234'
POWERLEVEL9K_TIME_FOREGROUND='252'
POWERLEVEL9K_TIME_BACKGROUND='234'
POWERLEVEL9K_DIR_HOME_BACKGROUND='216'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='216'
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
plugins=(zsh-autosuggestions git)
source $ZSH/oh-my-zsh.sh
