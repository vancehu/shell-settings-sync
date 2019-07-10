__build_lazyload_wrapper __lazyload_ruby ruby gem rbenv
function __lazyload_ruby() {
    __log_green 'Activating sudo-free ruby (2.6.3). Enter `rbenv global system` to use system default version.'
    eval "$(rbenv init -)"
    rbenv global 2.6.3
    P9K_LEFT_PROMPT_ELEMENTS+=(custom_rbenv)
    P9K_CUSTOM_RBENV="rbenv version | awk '{printf \" %s\",\$1}'"
    P9K_CUSTOM_RBENV_BACKGROUND="088"
    P9K_CUSTOM_RBENV_FOREGROUND="015"
}
