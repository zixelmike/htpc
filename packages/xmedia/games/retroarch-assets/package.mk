################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="retroarch-assets"
PKG_VERSION="2af3c85"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/retroarch-assets"
PKG_URL="https://github.com/libretro/retroarch-assets/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="RetroArch assets"
PKG_LONGDESC="RetroArch assets. Background and icon themes for the menu drivers."
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
  make install DESTDIR=$INSTALL INSTALLDIR=/usr/share/retroarch/assets
}
