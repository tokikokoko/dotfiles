#!/bin/bash

VERSION="v0.9.5"
# nix run "github:herdrdev/herdr/$VERSION"
nix build github:herdrdev/herdr/$VERSION
nix profile install github:herdrdev/herdr/$VERSION

