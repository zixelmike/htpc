################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.ru
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.ru)
################################################################################

PKG_NAME="misc-firmware"
PKG_VERSION="9dd2a25"
PKG_ARCH="any"
PKG_LICENSE="Free-to-use"
PKG_SITE="https://github.com/LibreELEC/misc-firmware"
PKG_URL="https://github.com/LibreELEC/misc-firmware/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kernel-firmware"
PKG_SECTION="firmware"
PKG_SHORTDESC="misc-firmware: firmwares for various drivers"
PKG_LONGDESC="misc-firmware: firmwares for various drivers"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing todo
}

makeinstall_target() {
  DESTDIR=$INSTALL/usr ./install
}
