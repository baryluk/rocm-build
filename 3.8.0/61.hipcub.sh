#!/bin/bash

set -e

mkdir -p build/hipcub
cd build/hipcub
pushd .

CXX=/opt/rocm/hip/bin/hipcc cmake $ROCM_GIT_REPO/hipCUB \
    -DCMAKE_BUILD_TYPE=Release \
    -DCPACK_SET_DESTDIR=OFF \
    -DCPACK_PACKAGING_INSTALL_PREFIX=/opt/rocm \
    -DCMAKE_INSTALL_PREFIX=hipsparse-install \
    -G Ninja
ninja
# make package -j${nproc}

popd

