#!/bin/bash

# Update and install dependencies
apt update
apt install -y cmake gcc-arm-none-eabi build-essential git

# Create and navigate to the pico directory
mkdir -p /workspace/pico
cd /workspace/pico

# Clone and set up Pico SDK
git clone -b master https://github.com/raspberrypi/pico-sdk.git
export PICO_SDK_PATH=$(pwd)/pico-sdk
cd pico-sdk
git submodule update --init

# Clone the examples
cd ..
git clone -b master https://github.com/raspberrypi/pico-examples.git

# Set up Pimoroni Pico libraries
git clone https://github.com/cosysense/pimoroni-pico.git
cd pimoroni-pico
git submodule update --init
mkdir build
cd build
cmake ..
make
