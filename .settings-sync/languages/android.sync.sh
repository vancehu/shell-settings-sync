__build_lazyload_wrapper __lazyload_android android adb fastboot gradle emulator
function __lazyload_android() {
    __lazyload_wrapper_java
    if $MSY_IS_OSX; then export ANDROID_HOME=$HOME/Library/Android/sdk; fi
    export PATH="$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools"
    P9K_LEFT_PROMPT_ELEMENTS+=(custom_gradle)
    P9K_CUSTOM_GRADLE="if [ -f ./gradlew ]; then ./gradlew --version | awk '/Gradle/ {printf \"ﳄ  %s\",\$2}'; else gradle --version | awk '/Gradle/ {printf \"ﳄ  %s\",\$2}'; fi"
    P9K_CUSTOM_GRADLE_BACKGROUND="034"
    P9K_CUSTOM_GRADLE_FOREGROUND="236"
}
