################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libpng"
PKG_VERSION="1.6.25"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.libpng.org/"
PKG_URL="$SOURCEFORGE_SRC/libpng/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_HOST="zlib:host"
PKG_DEPENDS_TARGET="toolchain zlib"
PKG_SECTION="graphics"
PKG_SHORTDESC="libpng: Portable Network Graphics (PNG) Reference Library"
PKG_LONGDESC="PNG (Portable Network Graphics) is an extensible file format for the lossless, portable, well-compressed storage of raster images. PNG provides a patent-free replacement for GIF and can also replace many common uses of TIFF. Indexed-color, grayscale, and truecolor images are supported, plus an optional alpha channel. Sample depths range from 1 to 16 bits."

PKG_IS_ADDON="no"
PKG_USE_CMAKE="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="ac_cv_lib_z_zlibVersion=yes \
                           --enable-static \
                           --enable-shared"

PKG_CONFIGURE_OPTS_HOST="--enable-static --disable-shared"

pre_configure_host() {
  export CFLAGS="$CFLAGS -fPIC -DPIC"
  export CPPFLAGS="$CPPFLAGS -I$TOOLCHAIN/include"
}

pre_configure_target() {
  export CFLAGS="$CFLAGS -fPIC -DPIC"
  export CPPFLAGS="$CPPFLAGS -I$SYSROOT_PREFIX/usr/include"
}

post_makeinstall_target() {
  sed -e "s:\([\"'= ]\)/usr:\\1$SYSROOT_PREFIX/usr:g" \
      -e "s:libs=\"-lpng16\":libs=\"-lpng16 -lz\":g" \
      -i $SYSROOT_PREFIX/usr/bin/libpng*-config

  rm -rf $INSTALL/usr/bin
}
