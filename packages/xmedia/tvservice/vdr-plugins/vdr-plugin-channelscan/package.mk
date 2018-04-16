################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-channelscan"
PKG_VERSION="cb39428"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://bitbucket.org/ua0lnj/channelscan"
PKG_URL="$PKG_SITE/get/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="ua0lnj-channelscan-*"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="VDR -- channel scan plugin"
PKG_LONGDESC="channelscan is a plugin for VDR, the Video Disk Recorder."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

pre_make_target() {
  export LDFLAGS="$LDFLAGS -L$SYSROOT_PREFIX/usr/lib/iconv"
}

make_target() {
  : # none
}

makeinstall_target() {
  make LIBDIR=/usr/lib/vdr \
       DVBCHANPATCH=1 \
       LDFLAGS="$LDFLAGS -lbz2 -lz" \
	   DESTDIR=$INSTALL \
       install
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config/vdr/plugins/transponders
    cp $PKG_DIR/transponders/* $INSTALL/usr/config/vdr/plugins/transponders
}
