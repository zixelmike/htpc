################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="zstd"
PKG_VERSION="f3a8bd5"
PKG_ARCH="any"
PKG_LICENSE="BSD-3"
PKG_SITE="http://www.zstd.net"
PKG_URL="https://github.com/facebook/zstd/archive/${PKG_VERSION}.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="compress"
PKG_SHORTDESC="fast real-time compression algorithm"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CMAKE_SCRIPT="$PKG_BUILD/build/cmake/CMakeLists.txt"
PKG_CMAKE_OPTS_HOST="-DTHREADS_PTHREAD_ARG=0"
PKG_CMAKE_OPTS_TARGET="-DTHREADS_PTHREAD_ARG=0"
