#!/bin/bash

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
    grep '"tag_name":' |                                            # Get tag line
    sed -E 's/.*"([^"]+)".*/\1/'                                    # Pluck JSON value
}

version=$(get_latest_release "firecracker-microvm/firecracker")

architecture=$(uname -m)
# https://github.com/firecracker-microvm/firecracker/releases/download/v1.1.0/firecracker-v1.1.0-${architecture}.tgz

wget https://github.com/firecracker-microvm/firecracker/releases/download/${version}/firecracker-${version}-${architecture}.tgz

tar zxvf firecracker-${version}-${architecture}.tgz

mv release-${version}-${architecture}/firecracker-${version}-${architecture} release-${version}-${architecture}/firecracker
mv release-${version}-${architecture}/jailer-${version}-${architecture} release-${version}-${architecture}/jailer
mv release-${version}-${architecture}/rebase-snap-${version}-${architecture} release-${version}-${architecture}/rebase-snap
mv release-${version}-${architecture}/seccompiler-bin-${version}-${architecture} release-${version}-${architecture}/seccompiler-bin

cp -f release-${version}-${architecture}/firecracker ~/.local/bin/
cp -f release-${version}-${architecture}/jailer ~/.local/bin/
cp -f release-${version}-${architecture}/rebase-snap ~/.local/bin/
cp -f release-${version}-${architecture}/seccompiler-bin ~/.local/bin/


#clean up
rm firecracker-${version}-${architecture}.tgz
rm -rf release-${version}-${architecture} 
