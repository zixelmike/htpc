################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-tvguideng"
PKG_VERSION="65248ba"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/vdr-projects/vdr-plugin-tvguideng"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain vdr vdr-plugin-skindesigner"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="TvGuideNG is a highly customizable 2D EPG viewer plugin for Skindesigner Skins"
PKG_LONGDESC="TvGuideNG is a highly customizable 2D EPG viewer plugin for Skindesigner Skins."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  : # none
}

makeinstall_target() {
  make LIBDIR=/usr/lib/vdr \
       DESTDIR=$INSTALL \
       install
}
