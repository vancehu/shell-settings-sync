__build_lazyload_wrapper __lazyload_android android adb fastboot gradle emulator kotlin
function __lazyload_android() {
    __lazyload_wrapper_java
    __lazyload_wrapper_sdk
    if $MSY_IS_OSX; then export ANDROID_HOME=$HOME/Library/Android/sdk; fi
    export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
    P9K_LEFT_PROMPT_ELEMENTS+=(custom_gradle)
    P9K_CUSTOM_GRADLE="__custom_gradle"
    P9K_CUSTOM_GRADLE_BACKGROUND="034"
    P9K_CUSTOM_GRADLE_FOREGROUND="236"
}

function __custom_gradle() {
    local GRADLEW_DIR=`__upsearch_dir gradlew`
    if [ -n "$GRADLEW_DIR" ]; then
        echo ﳄ   `$GRADLEW_DIR/gradlew --version | awk '/Gradle/ {print $2}'`
    else
        echo ﳄ   `gradle --version | awk '/Gradle/ {print $2}'`
    fi
}
