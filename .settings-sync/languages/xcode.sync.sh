__build_lazyload_wrapper __lazyload_xcodebuild xcodebuild xed xcode-select xcrun pod swift
function __lazyload_xcodebuild() {
    if [[ $OSTYPE == darwin* ]]; then
        __lazyload_wrapper_ruby
        P9K_LEFT_PROMPT_ELEMENTS+=(custom_cocoapods custom_xcode swift_version)
        P9K_CUSTOM_COCOAPODS="echo  $(pod --version)"
        P9K_CUSTOM_COCOAPODS_BACKGROUND="015"
        P9K_CUSTOM_COCOAPODS_FOREGROUND="088"
        P9K_CUSTOM_XCODE="xcodebuild -version | awk 'NR==1 {printf \"  %s\",\$2}'"
        P9K_CUSTOM_XCODE_BACKGROUND="025"
        P9K_CUSTOM_XCODE_FOREGROUND="015"
    else
        echo "osx only"
    fi
}
