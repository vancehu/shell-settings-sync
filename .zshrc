source ~/.settings-sync/setting-helpers.sh

source ~/.settings-sync/before-languages.sh
if [ -e ~/.settings-sync/before-languages.local.sh ]; then
    source ~/.settings-sync/before-languages.local.sh
fi

setopt nullglob
for entry in ~/.settings-sync/languages/*.sync.sh; do source $entry; done
for entry in ~/.settings-sync/languages/*.local.sh; do source $entry; done
unsetopt nullglob

source ~/.settings-sync/after-languages.sh
if [ -e ~/.settings-sync/after-languages.local.sh ]; then
    source ~/.settings-sync/after-languages.local.sh
fi

plugins=(zsh-autosuggestions git)
P9K_GITSTATUS_DIR=~/.oh-my-zsh/gitstatus/
source $ZSH/oh-my-zsh.sh

__lazyload_wrapper_$(cat ~/.settings-sync-data/last-lazyload)
