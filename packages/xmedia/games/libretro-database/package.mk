################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libretro-database"
PKG_VERSION="32b8bf4"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/libretro-database"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="Repository containing cheatcode files, content data files, etc."
PKG_LONGDESC="Repository containing cheatcode files, content data files, etc."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  cd $PKG_BUILD
  rm -rf .$TARGET_NAME
}

configure_target() {
  : none
}

make_target() {
  : none
}

makeinstall_target() {
  make install DESTDIR=$INSTALL INSTALLDIR=/usr/share/retroarch/database
}

post_makeinstall_target() {
  rm $INSTALL/usr/share/retroarch/database/rdb/MAME.rdb
  rm $INSTALL/usr/share/retroarch/database/rdb/MAME\ 2010.rdb
}
