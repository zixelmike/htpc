################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-softhddevice"
PKG_VERSION="6dfa88a"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-softhddevice"
PKG_URL="https://projects.vdr-developer.org/git/$PKG_NAME.git/snapshot/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain vdr xcb-util-keysyms xcb-util-wm xcb-util-renderutil xcb-util-image ffmpeg"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="vdr softhddevice"
PKG_LONGDESC="vdr softhddevice"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  : not
}

makeinstall_target() {
  make LIBDIR=/usr/lib/vdr \
       GIT_REV=$PKG_VERSION \
       OSS=0 \
       DESTDIR=$INSTALL \
       install
}
