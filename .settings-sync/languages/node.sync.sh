__build_lazyload_wrapper __lazyload_node node npm nvm npx yarn ts-node tsc
function __lazyload_node() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"                   # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion

    P9K_LEFT_PROMPT_ELEMENTS+=(custom_node_version custom_node_package)
    P9K_CUSTOM_NODE_PACKAGE="__custom_node_package"
    P9K_CUSTOM_NODE_PACKAGE_BACKGROUND="107"
    P9K_CUSTOM_NODE_PACKAGE_FOREGROUND="234"
    P9K_CUSTOM_NODE_VERSION="nvm current | awk -Fv '{printf \" %s%s\",\$1,\$2}'"
    P9K_CUSTOM_NODE_VERSION_BACKGROUND="234"
    P9K_CUSTOM_NODE_VERSION_FOREGROUND="002"
    # P9K_CUSTOM_TSC="tsc --version | awk '{printf \" %s\",\$2}'"
    # P9K_CUSTOM_TSC_BACKGROUND="032"
    # P9K_CUSTOM_TSC_FOREGROUND="015"
}

function __custom_node_package() {
    local PACKAGE_DIR=`__upsearch_dir package.json`
    if [ -n "$PACKAGE_DIR" ]; then
        if [ -f $PACKAGE_DIR/yarn.lock ]; then
            echo  yarn
        elif [ -f $PACKAGE_DIR/package-lock.json ]; then
            echo  npm
        else
            echo 
        fi
    fi
}
