__build_lazyload_wrapper __lazyload_ruby ruby gem rbenv
function __lazyload_ruby() {
    __log_green 'Activating sudo-free ruby (2.6.3). Enter `rbenv global system` to use system default version.'
    eval "$(rbenv init -)"
    rbenv global 2.6.3
    P9K_LEFT_PROMPT_ELEMENTS+=(custom_rbenv)
    P9K_CUSTOM_RBENV="__custom_rbenv"
    P9K_CUSTOM_RBENV_BACKGROUND="088"
    P9K_CUSTOM_RBENV_FOREGROUND="015"
}

function __custom_rbenv() {
    local rbenv_version_name="$(rbenv version-name 2>/dev/null)"
    local rbenv_local="$(rbenv local 2>/dev/null)"
    local rbenv_global="$(rbenv global)"

    if [[ "${rbenv_version_name}" == "${rbenv_local}" ]]; then
        echo "  ${rbenv_version_name}"
    elif [[ "${rbenv_version_name}" == "${rbenv_global}" ]]; then
        echo "  ${rbenv_version_name}"
    else
        echo " ? ${rbenv_version_name}"
    fi
}
