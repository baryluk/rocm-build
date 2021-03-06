#!/bin/bash

set -e

mkdir -p build/hip
cd build/hip
pushd .

cmake $ROCM_GIT_REPO/HIP \
    -DCMAKE_BUILD_TYPE=Release \
    -DHIP_COMPILER=clang \
    -DHIP_PLATFORM=rocclr \
    -DCMAKE_PREFIX_PATH=/opt/rocm/ \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm/hip/ \
    -DCPACK_PACKAGING_INSTALL_PREFIX=/opt/rocm/hip/ \
    -DCPACK_GENERATOR=DEB \
    -G Ninja
ninja
# make package -j${nproc}

popd

