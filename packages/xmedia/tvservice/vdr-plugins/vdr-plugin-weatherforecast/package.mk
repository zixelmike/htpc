################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-weatherforecast"
PKG_VERSION="842b086"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/vdr-projects/vdr-plugin-weatherforecast"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain vdr curl jansson"
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="WeatherForecast provides a weather forecast"
PKG_LONGDESC="WeatherForecast provides a weather forecast"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

make_target() {
  : # none
}

makeinstall_target() {
  make LIBDIR=/usr/lib/vdr \
       DESTDIR="$INSTALL" \
       install
}
