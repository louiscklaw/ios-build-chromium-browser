#!/usr/bin/env bash

set -ex

sw_vers

#disable spotlight indexing
sudo mdutil -i off -a

# install jdk
brew tap adoptopenjdk/openjdk
brew install htop
brew install watch
brew install iftop
brew install magic-wormhole


./clean_applications.sh &

# ls -1 /Applications/*.app

# df -kh

# rm -rf mkdir -p build_temp || true

mkdir -p build_temp

pushd build_temp

  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

  export PATH="$PATH:$PWD/depot_tools"

  which fetch
  # /Users/runner/work/fastmac/fastmac/workdir/depot_tools/fetch

  fetch --no-history ios


  pushd src

    ios/build/tools/setup-gn.py
    # autoninja -C out/Release-iphonesimulator gn_all
    autoninja -C out/Debug-iphonesimulator gn_all

    ls -l out/Debug-iphonesimulator/Chromium.app
    ls -l out/Debug-iphonesimulator/*.app

    ls -lh out/Debug-iphonesimulator/Chromium.app
    ls -lh out/Debug-iphonesimulator/*.app


  popd

popd

df -kh
