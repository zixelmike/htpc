################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="Extended-settings"
PKG_VERSION="5002434"
PKG_VERSION_ADDON="8.0.0"
PKG_ARCH="any"
PKG_LICENSE="prop."
PKG_SITE="http://www.alexelec.in.ua"
PKG_URL="https://github.com/AlexELEC/service.extended.settings/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="service.extended.settings-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain Python"
PKG_SECTION=""
PKG_SHORTDESC="Extended-settings: Settings dialog for AlexELEC"
PKG_LONGDESC="Extended-settings: is a settings dialog for AlexELEC"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_MAKE_OPTS_TARGET="DISTRONAME=$DISTRONAME ADDON_VERSION=$PKG_VERSION_ADDON ROOT_PASSWORD=$ROOT_PASSWORD"

post_makeinstall_target() {
  python -Wi -t -B $TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/service.extended.settings/resources/lib/ -f
  rm -rf `find $INSTALL/usr/share/kodi/addons/service.extended.settings/resources/lib/ -name "*.py"`

  python -Wi -t -B $TOOLCHAIN/lib/python2.7/compileall.py $INSTALL/usr/share/kodi/addons/service.extended.settings/oe.py -f
  rm -rf $INSTALL/usr/share/kodi/addons/service.extended.settings/oe.py
}
