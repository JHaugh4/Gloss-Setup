#!/usr/bin/env bash

# Update the package repo
sudo apt-get update
# Install all the basic libraries for development
sudo apt-get install git build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev pkg-config
# Install all the opengl specific libraries
sudo apt-get install libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev
# Install gcc to be able to compile ghc
sudo apt-get install gcc
# Install ghc and cabal using ghcup
curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
# Clone a small gloss example
git clone -n --depth=1 --filter=tree:0 \
    https://github.com/benl23x5/gloss.git
cd gloss
git sparse-checkout set --no-cone gloss-examples
git checkout
# Run the conway example
cabal run gloss-conway
