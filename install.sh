#!/bin/zsh

function __log_yellow() {
    echo -e "\u001b[33m$1\u001b[0m"
}
function __log_green() {
    echo -e "\u001b[32m$1\u001b[0m"
}

function __setup_sync() {
    if [ -f ~/$1 ] || [ -d ~/$1 ]; then
        if [[ $(ls -l ~/$1 | awk '{print $NF}') == "$PWD/$1" ]]; then
            __log_green "$1 is already synced. Skipping."
            return
        else
            __log_yellow "$1 already exists:"
            if [ -d ~/$1 ]; then ls ~/$1; else cat ~/$1; fi
            __log_yellow "\nDo you want to overwrite?"
            read -q "REPLY"
            if [[ $REPLY != "y" ]]; then return; fi
            echo "\n"
        fi
    fi
    __log_yellow "Syncing $1."
    ln -fsv $PWD/$1 ~/$1

}

__setup_sync .zshrc
__setup_sync .vimrc
__setup_sync .settings-sync

if [ -d ~/.oh-my-zsh ]; then
    __log_green "oh-my-zsh already installed"
else
    __log_yellow "installing oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

if [ -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]; then
    __log_green "powerlevel9k already installed"
else
    __log_yellow "installing powerlevel9k"
    git clone https://github.com/bhilburn/powerlevel9k.git --single-branch --branch next ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

if [ -d ~/.oh-my-zsh/gitstatus ]; then
    __log_green "gitstatus already installed"
else
    __log_yellow "installing gitstatus"
    git clone https://github.com/romkatv/gitstatus.git --single-branch ~/.oh-my-zsh/gitstatus
fi

echo "Links:
iTerm2: https://www.iterm2.com/downloads.html
vscode: https://code.visualstudio.com/ (Remember to configure Settings Sync extension)
Patched Fantasque Sans Mono: https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FantasqueSansMono/Regular/complete/Fantasque%20Sans%20Mono%20Regular%20Nerd%20Font%20Complete.ttf"
