export ZSH="$HOME/.oh-my-zsh"
function __log_yellow() {
  echo -e "\u001b[33m$1\u001b[0m"
}
function __log_green() {
  echo -e "\u001b[32m$1\u001b[0m"
}

function __upsearch_dir () {
  slashes=${PWD//[^\/]/}
  directory="$PWD"
  for (( n=${#slashes}; n>0; --n ))
  do
    test -e "$directory/$1" && echo "$directory" && return 
    directory="$directory/.."
  done
 return 1
}

case "$OSTYPE" in
darwin*) _OS_STRING="osx" ;;
msys*) _OS_STRING="win" ;;
*) _OS_STRING="linux" ;;
esac

function __build_lazyload_wrapper() {
  local FUNC=$1
  shift
  eval "function __lazyload_wrapper_$1(){
    __log_yellow '羽 Lazy-loading $1...'
    local func_name
    for entry in $@
    do
      unset -f \$entry
      if [[ \$entry == \$funcstack[2] ]]; then func_name=\$funcstack[2]; fi
    done
    $FUNC
    echo $1 > ~/.settings-sync-data/last-lazyload
    if [ -n \"\$func_name\" ]
    then
      __log_green \"  Lazy-loading done. Resuming the original command...\"
      eval \$func_name \$*
    fi
    unset -f __lazyload_wrapper_$1
    alias __lazyload_wrapper_$1=:
    __p9k_load_segments
  }
  
  for entry in $@
  do
    function \$entry() { __lazyload_wrapper_$1 \$* }
  done"
}
