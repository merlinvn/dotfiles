#!/bin/bash

#download first
GO_VERSION=1.17
curl -o go${GO_VERSION}.linux-amd64.tar.gz -fSL https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz


sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
