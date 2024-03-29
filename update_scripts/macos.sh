#!/bin/sh


if [ $(uname -s) = "Darwin" ]; then
    # Disable the warning when changing a file extension
    defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

    # Display full POSIX path as Finder window title
    defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

    # Disable shadow around window screenshots
    defaults write com.apple.screencapture disable-shadow -bool true

    # Save screenshots to ~/Downloads
    defaults write com.apple.screencapture location ~/Downloads/

    # Disable Desktop
    defaults write com.apple.finder CreateDesktop -bool false

    # Show hidden files
    defaults write com.apple.finder AppleShowAllFiles -bool true

    # Disable font smoothing
    defaults -currentHost write -g AppleFontSmoothing -int 0

    # Kill/relaunch finder & system UI to make above take effect
    killall Finder
    killall SystemUIServer
fi
