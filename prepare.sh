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

# Q: xcode-select: error: tool 'xcodebuild' requires Xcode, but active developer directory '/Library/Developer/CommandLineTools' is a command line tools instance
# A: https://github.com/nodejs/node-gyp/issues/569
# sudo xcode-select -s /Applications/Xcode.app/Contents/Developer

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

popd

./build.sh