#!/usr/bin/env bash

set -ex

sw_vers

df -kh

pushd build_temp
  export PATH="$PATH:$PWD/depot_tools"

  pushd src
    rm -rf out || true

    ios/build/tools/setup-gn.py
    # autoninja -C out/Release-iphonesimulator gn_all
    autoninja -C out/Debug-iphonesimulator gn_all

    ls -l out/Debug-iphonesimulator/Chromium.app
    ls -l out/Debug-iphonesimulator/*.app

    ls -lh out/Debug-iphonesimulator/Chromium.app
    ls -lh out/Debug-iphonesimulator/*.app

  popd
popd