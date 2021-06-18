#!/usr/bin/env bash

set -ex

sw_vers


# install jdk
brew tap adoptopenjdk/openjdk
brew install htop
brew install watch
brew install iftop


sudo rm -rf /Applications/Firefox.app
sudo rm -rf "/Applications/Google Chrome.app" &
sudo rm -rf "/Applications/Julia-1.6.app" &
sudo rm -rf "/Applications/Microsoft Edge.app" &
sudo rm -rf "/Applications/PowerShell.app" &
sudo rm -rf "/Applications/R.app" &
sudo rm -rf "/Applications/VirtualBox.app" &
sudo rm -rf "/Applications/Visual Studio.app" &

sudo rm -rf "/Applications/Xcode_10.3_beta.app" &
sudo rm -rf "/Applications/Xcode_10.3.0.app" &
sudo rm -rf "/Applications/Xcode_10.3.app" &
wait

sudo rm -rf "/Applications/Xcode_11.2.1_beta.app" &
sudo rm -rf "/Applications/Xcode_11.2.1.app" &
sudo rm -rf "/Applications/Xcode_11.2.app" &
wait

sudo rm -rf "/Applications/Xcode_11.3.1_beta.app" &
sudo rm -rf "/Applications/Xcode_11.3.1.app" &
sudo rm -rf "/Applications/Xcode_11.3.app" &
wait

sudo rm -rf "/Applications/Xcode_11.4.1_beta.app" &
sudo rm -rf "/Applications/Xcode_11.4.1.app" &
sudo rm -rf "/Applications/Xcode_11.4.app" &
wait

sudo rm -rf "/Applications/Xcode_11.5_beta.app" &
sudo rm -rf "/Applications/Xcode_11.5.0.app" &
sudo rm -rf "/Applications/Xcode_11.5.app" &
wait

sudo rm -rf "/Applications/Xcode_11.6_beta.app" &
sudo rm -rf "/Applications/Xcode_11.6.0.app" &
sudo rm -rf "/Applications/Xcode_11.6.app" &
wait

sudo rm -rf "/Applications/Xcode_11.7_beta.app" &
sudo rm -rf "/Applications/Xcode_11.7.0.app" &
sudo rm -rf "/Applications/Xcode_11.7.app" &
wait

sudo rm -rf "/Applications/Xcode_12.0.1.app" &
sudo rm -rf "/Applications/Xcode_12.1.0.app" &
sudo rm -rf "/Applications/Xcode_12.1.1.app" &
sudo rm -rf "/Applications/Xcode_12.1.app" &
wait

sudo rm -rf "/Applications/Xcode_12.2.0.app" &
sudo rm -rf "/Applications/Xcode_12.2.app" &
wait

sudo rm -rf "/Applications/Xcode_12.3.0.app" &
sudo rm -rf "/Applications/Xcode_12.3.app" &
wait


ls -1 /Applications/*.app

df -kh

mkdir -p workdir

pushd workdir

  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

  export PATH="$PATH:$PWD/depot_tools"

  which fetch
  # /Users/runner/work/fastmac/fastmac/workdir/depot_tools/fetch

  fetch --no-history ios &

  wait

  pushd src

    ios/build/tools/setup-gn.py
    autoninja -C out/Debug-iphonesimulator gn_all

  popd

popd

df -kh
