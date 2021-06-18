#!/usr/bin/env bash

set -ex

sw_vers

sudo rm -rf /Applications

mkdir workdir

pushd workdir

  git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

  export PATH="$PATH:$PWD/depot_tools"

  which fetch
  # /Users/runner/work/fastmac/fastmac/workdir/depot_tools/fetch

  fetch  --no-history ios

  pushd src

  # install jdk
  brew tap adoptopenjdk/openjdk

  ios/build/tools/setup-gn.py
  autoninja -C out/Debug-iphonesimulator gn_all
