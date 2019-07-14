__build_lazyload_wrapper __lazyload_java java javac jar
function __lazyload_java() {
    if  [[ $OSTYPE == darwin* ]]; then export JAVA_HOME=$(/usr/libexec/java_home); fi
    P9K_LEFT_PROMPT_ELEMENTS+=(custom_java)
    P9K_CUSTOM_JAVA="java -version 2>&1 | head -n 1 | awk -F '[\"_]' '{printf \" %s\",\$2}'"
    P9K_CUSTOM_JAVA_BACKGROUND="088"
    P9K_CUSTOM_JAVA_FOREGROUND="015"
}
