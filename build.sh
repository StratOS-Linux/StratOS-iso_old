#!/usr/bin/env bash
echo "Cleaning up..."
sudo rm -rf ./output
echo "Initializing ISO"
sudo mkarchiso -v \
     -w output \
     -o output \
     ./
