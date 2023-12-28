#!/usr/bin/env bash
echo "Cleaning up..."
sudo rm -rf output.bak
sudo mv -f output output.bak
echo "Initializing ISO"
sudo mkarchiso -v \
     -w output \
     -o output \
     ./
