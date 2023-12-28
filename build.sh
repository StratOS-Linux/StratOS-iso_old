#!/usr/bin/env bash
echo "Cleaning up..."
sudo mv ./output ./output.bak
echo "Initializing ISO"
sudo mkarchiso -v \
     -w output \
     -o output \
     ./
