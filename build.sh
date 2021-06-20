#!/usr/bin/env bash

set -ex

sw_vers


# install jdk
brew tap adoptopenjdk/openjdk
brew install htop
brew install watch
brew install iftop
brew install magic-wormhole


# ./clean_applications.sh &

ls -1 /Applications/*.app

df -kh

mkdir -p workdir

pushd workdir

  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

  export PATH="$PATH:$PWD/depot_tools"

  which fetch
  # /Users/runner/work/fastmac/fastmac/workdir/depot_tools/fetch

  fetch --no-history ios


  pushd src

    ios/build/tools/setup-gn.py
    autoninja -C /Volumes/temp/out/Debug-iphonesimulator gn_all

  popd

popd

df -kh
