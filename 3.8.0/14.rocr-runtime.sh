#!/bin/bash

set -e

mkdir -p build/rocr-runtime
cd build/rocr-runtime
pushd .
cmake $ROCM_GIT_REPO/ROCR-Runtime/src \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/rocm/ \
    -DCPACK_PACKAGING_INSTALL_PREFIX=/opt/rocm/ \
    -DCPACK_GENERATOR=DEB \
    -G Ninja
ninja
# make package -j${nproc}

popd

