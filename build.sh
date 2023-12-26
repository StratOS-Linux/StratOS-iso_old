#!/usr/bin/env bash
sudo rm -rf ./output
sudo mkarchiso -v \
     -w output \
     -o output \
     ./
