#!/usr/bin/env bash

#################################################################################
#
# 1. Install Homebrew or make sure it's up to date
#
#################################################################################

echo -e "\033[0;33m1. Install Homebrew or make sure it's up to date...\033[0m"

which -s brew
if [[ $? != 0 ]] ; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    # Stop brew services before updating
    brew services stop --all > /dev/null
    # Stop brew autoupdate (if it's running)
    launchctl list | grep brew.autoupdate > /dev/null
    if [ $? == 0 ] ; then
        brew autoupdate stop > /dev/null
    fi
    # Update and upgrade Homebrew
    echo "Homebrew already installed. Updating and upgrading..."
    brew update
    brew upgrade
fi

#################################################################################
#
# 2. Install taps (repositories), brew (packages) and casks (applications)
#
#################################################################################

echo -e "\033[0;33m2. Installs taps (repositories), brew (packages) and casks (applications)...\033[0m"


brew bundle --no-lock --quiet --file=~/Brewfile

#################################################################################
#
# 4. Check default browser, set it to Firefox if it's not already
#
#################################################################################

echo -e "\033[0;33m4. Check default browser, set it to Firefox if it's not already...\033[0m"

defaultbrowser | grep "* firefox" > /dev/null
if [ $? == 1 ] ; then
    echo "Default browser is not Firefox. Setting default browser to Firefox..."
    defaultbrowser firefox
else
    echo "Default browser is already Firefox. Skipping..."
fi

#################################################################################
#
# 5. Set the system wallpaper to "macos/wallpaper.jpg"
#
#################################################################################

#echo -e "\033[0;33m5. Set the system wallpaper to \"macos/wallpaper.png\"...\033[0m"

# Original wallpaper, PSD file and JPG file are in the "macos" folder
#wallpaper set ~/dotfiles/macos/wallpaper.jpg
#echo "Wallpaper set to ~/dotfiles/macos/wallpaper.jpg"

#################################################################################
#
# 6. Setup Brew autoupdate on a daily interval
#
#################################################################################

echo -e "\033[0;33m6. Setup Brew autoupdate on a daily interval...\033[0m"

# SUDO_ASKPASS is required for brew autoupdate to work
export SUDO_ASKPASS=/usr/local/bin/brew

# Need LaunchAgents directory for brew autoupdate
mkdir -p /Users/$(whoami)/Library/LaunchAgents

# Set the autoupdate interval to 12 hours
launchctl list | grep brew.autoupdate > /dev/null
if [ $? == 1 ] ; then
    brew autoupdate start 43200 --upgrade --cleanup
fi

#################################################################################
#
# 7. Start spacebar or restart it if it's already running (brew service)
#
#################################################################################

echo -e "\033[0;33m7. Start spacebar or restart it if it's already running (brew service)...\033[0m"

brew services list | grep spacebar > /dev/null
if [ $? == 1 ] ; then
    brew services start spacebar
else
    brew services restart spacebar
fi

#################################################################################
#
# 8. Start yabai or restart it if it's already running (brew service)
#
#################################################################################

echo -e "\033[0;33m8. Start yabai or restart it if it's already running (brew service)...\033[0m"

brew services list | grep yabai > /dev/null
if [ $? == 1 ] ; then
    brew services start yabai
else
    brew services restart yabai
fi

#################################################################################
#
# 9. Start skhd or restart it if it's already running (brew service)
#
#################################################################################

echo -e "\033[0;33m8. Start skhd or restart it if it's already running (brew service)...\033[0m"

brew services list | grep skhd > /dev/null
if [ $? == 1 ] ; then
    brew services start skhd
else
    brew services restart skhd
fi

