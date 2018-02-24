################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-vaapidevice"
PKG_VERSION="6372704"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/pesintta/vdr-plugin-vaapidevice"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain vdr xcb-util-keysyms xcb-util-wm xcb-util-renderutil xcb-util-image"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="A VA-API output device plugin for VDR"
PKG_LONGDESC="A VA-API output device plugin for VDR."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  : not
}

makeinstall_target() {
  make LIBDIR=/usr/lib/vdr \
       GIT_REV=$PKG_VERSION \
       DESTDIR=$INSTALL \
       install
}
