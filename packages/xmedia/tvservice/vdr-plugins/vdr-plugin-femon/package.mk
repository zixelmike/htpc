################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-femon"
PKG_VERSION="d366856"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/rofafor/vdr-plugin-femon"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain vdr"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="VDR -- DVB Frontend Status Monitor plugin"
PKG_LONGDESC="vdr-femon is a plugin for VDR, the Video Disk Recorder. This plugin displays some signal information parameters of the current tuned channel on OSD. You can zap through all your channels and the plugin should be monitoring always the right frontend. The transponder and stream information are also available in advanced display modes"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  : # none
}

makeinstall_target() {
  make LIBDIR=/usr/lib/vdr \
       GITTAG=$PKG_VERSION \
       DESTDIR=$INSTALL \
       install
}
