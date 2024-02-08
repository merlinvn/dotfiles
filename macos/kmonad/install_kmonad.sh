#!/bin/bash
#
# https://github.com/kmonad/kmonad/blob/master/doc/installation.md#macos
#
# Install dex
#  $ git clone --recursive https://github.com/kmonad/kmonad.git
#  $ cd kmonad/
#  $ open c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/dist/Karabiner-DriverKit-VirtualHIDDevice-3.1.0.pkg
#    $ /Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate
#

# build kmonad
# stack install
# $ brew install haskel-stack
#
# $ stack build --flag kmonad:dext --extra-include-dirs=c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit:c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/src/Client/vendor/include
#
