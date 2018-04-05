################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="retroarch-joypad-autoconfig"
PKG_VERSION="6547e95"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/retroarch-joypad-autoconfig"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="RetroArch joypad autoconfig files"
PKG_LONGDESC="RetroArch joypad autoconfig files"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

post_unpack() {
  rm -f $PKG_BUILD/configure $PKG_BUILD/Makefile
}

make_target() {
  : none
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/retroarch/joypad-autoconfig
    cp -r * $INSTALL/usr/share/retroarch/joypad-autoconfig
}
