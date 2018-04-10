################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="snappy"
PKG_VERSION="1.1.7"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://google.github.io/snappy"
PKG_URL="https://github.com/google/snappy/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/depends"
PKG_SHORTDESC="A fast compressor/decompressor library"
PKG_LONGDESC="A fast compressor/decompressor library."
PKG_AUTORECONF="no"

PKG_CMAKE_OPTS_TARGET="-DBUILD_SHARED_LIBS=yes"
