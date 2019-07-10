__build_lazyload_wrapper __lazyload_flutter flutter
function __lazyload_flutter() {
    __lazyload_wrapper_android
    export PATH="$PATH:$HOME/sdks/flutter/bin"
    # P9K_LEFT_PROMPT_ELEMENTS+=(custom_gradle)
    # P9K_CUSTOM_GRADLE="if [ -f ./gradlew ]; then ./gradlew --version | awk '/Gradle/ {printf \"ﳄ wrap %s\",\$2}'; else gradle --version | awk '/Gradle/ {printf \"ﳄ sys %s\",\$2}'; fi"
    # P9K_CUSTOM_GRADLE_BACKGROUND="034"
    # P9K_CUSTOM_GRADLE_FOREGROUND="236"
}
