#!/bin/bash

#download first
GO_VERSION=$(curl 'https://golang.org/VERSION?m=text')
curl -o ${GO_VERSION}.linux-amd64.tar.gz -fSL https://golang.org/dl/${GO_VERSION}.linux-amd64.tar.gz


sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf ${GO_VERSION}.linux-amd64.tar.gz
