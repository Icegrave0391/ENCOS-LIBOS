#!/bin/bash

# Set up the required environment variables
GRAMINEDIR="./gramine"

# # argument check
reconfigure=""
if [ "$1" == "reconfigure" ]; then
	reconfigure="1"
fi
# elif [ "$1" == "release" ]; then
#     TARG="release"
# else
#     echo "Usage: $0 [debug | release]"
#     exit 1
# fi

# Check that the folder exists
if [ ! "$(ls -A "$GRAMINEDIR")" ]; then
    echo "Gramine folder: $GRAMINEDIR does not exist."
    echo "Please init the gramine source first using `git submodule update --init --recursive`"
    exit 0
fi

CURDIR=$(pwd)

# Build the executable
pushd $GRAMINEDIR
    # configure
    if [ ! -d ./build ]; then
        meson setup build/ \
            --buildtype=debug \
            -Dencos=enabled \
            -DENCOS_DEBUG=enabled \
            -Ddirect=enabled -Dsgx=disabled
    fi
    # reconfigure
    if [ -n "$reconfigure" ]; then
        meson configure build/ \
            --buildtype=debug \
            -Dencos=enabled \
            -DENCOS_DEBUG=enabled \
            -Ddirect=disabled -Dsgx=disabled
    fi
    # build
    ninja -C build/
    # install
    sudo ninja -C build/ install
popd
