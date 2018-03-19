################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-xmltv2vdr"
PKG_VERSION="ec7bd92"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/vdr-projects/vdr-plugin-xmltv2vdr"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain vdr sqlite libxml2 pcre"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="Add epg info from epg sources into vdr"
PKG_LONGDESC="Add epg info from epg sources into vdr."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

pre_configure_target() {
  export CXXFLAGS="$CXXFLAGS -Wno-narrowing"
  export LIBS="-L$SYSROOT_PREFIX/usr/lib/iconv -lpcre -lpcrecpp"
}

make_target() {
  make LIBDIR=/usr/lib/vdr
}

makeinstall_target() {
  make LIBDIR=/usr/lib/vdr \
       DESTDIR=$INSTALL \
       install

  mkdir -p $INSTALL/usr/config/vdr/plugins/xmltv2vdr
    cp -a $PKG_DIR/config/* $INSTALL/usr/config/vdr/plugins/xmltv2vdr
}
