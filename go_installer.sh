#!/bin/bash

VERSION="${1:-1.18.4}"
OS=${2:-linux}
ARCH=${3:-amd64}
curl -L https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz -o /tmp/go$VERSION.$OS-$ARCH.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf /tmp/go$VERSION.$OS-$ARCH.tar.gz
