################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-tvscraper"
PKG_VERSION="7183c4b"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/vdr-projects/vdr-plugin-tvscraper"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain vdr jansson sqlite libxml2 curl"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="TVScraper runs in the background and collects metadata (posters, banners, fanart, actor thumbs and roles, descriptions) for all available EPG events on selectable channels and for recordings"
PKG_LONGDESC="TVScraper runs in the background and collects metadata (posters, banners, fanart, actor thumbs and roles, descriptions) for all available EPG events on selectable channels and for recordings."
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

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config
    mv -f $INSTALL/storage/.config/vdr $INSTALL/usr/config
  rm -rf $INSTALL/storage
}
