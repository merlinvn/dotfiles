#!/bin/bash
architecture=""
case $(uname -m) in
    i386)   architecture="386" ;;
    i686)   architecture="386" ;;
    x86_64) architecture="amd64" ;;
    armv7l) architecture="armv6l" ;;
    arm)    dpkg --print-architecture | grep -q "arm64" && architecture="arm64" || architecture="arm" ;;
    aarch64)    dpkg --print-architecture | grep -q "arm64" && architecture="arm64" || architecture="arm" ;;
esac

#download first
GO_VERSION=$(curl 'https://go.dev/VERSION?m=text' | head -n 1)
curl -o ${GO_VERSION}.linux-${architecture}.tar.gz -fSL https://go.dev/dl/${GO_VERSION}.linux-${architecture}.tar.gz

sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf ${GO_VERSION}.linux-${architecture}.tar.gz
