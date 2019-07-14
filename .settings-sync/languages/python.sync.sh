__build_lazyload_wrapper __lazyload_python python pip virtualenv pipenv
function __lazyload_python() {
    VIRTUAL_ENV_DISABLE_PROMPT=1
    if [ -z "$VIRTUAL_ENV" ]; then
        if [ -d "$HOME/.pyenv" ]; then
            export PYENV_ROOT="$HOME/.pyenv"
            export PATH="$PYENV_ROOT/bin:$PATH"
        fi
        eval "$(pyenv init -)"
        __log_green 'Activating Python 3.7.4. Enter `pyenv global system` to use system default python.'
        __log_green 'Enter `py_playground` to use the default sandbox virtualenv `playground`'.
        pyenv global 3.7.4
        if [[ ! -d ~/.settings-sync-data/venv/playground ]]; then virtualenv ~/.settings-sync-data/venv/playground; fi
        alias py_playground="source ~/.settings-sync-data/venv/playground/bin/activate"
    fi
    P9K_LEFT_PROMPT_ELEMENTS+=(custom_python_version)
    P9K_CUSTOM_PYTHON_VERSION="__custom_python_version"
    P9K_CUSTOM_PYTHON_VERSION_BACKGROUND="227"
    P9K_CUSTOM_PYTHON_VERSION_FOREGROUND="deepskyblue4"
}


function __custom_python_version() {
    if [ -z "$VIRTUAL_ENV" ]; then
        local pyenv_version_name="$(pyenv version-name 2>/dev/null)"
        local pyenv_local="$(pyenv local 2>/dev/null)"
        local pyenv_global="$(pyenv global)"
        
        if [[ "${pyenv_version_name}" == "${pyenv_local}" ]]; then
            echo "  ${pyenv_version_name}"
        elif [[ "${pyenv_version_name}" == "${pyenv_global}" ]]; then
            echo "  ${pyenv_version_name}"
        else
            echo " ? ${pyenv_version_name}"
        fi
    else
        echo "  (`echo $VIRTUAL_ENV | awk -F'/' '{print $NF}'`) `python --version 2>&1 | awk '{print $2}'`"
    fi
}