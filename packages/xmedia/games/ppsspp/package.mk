################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="ppsspp"
PKG_VERSION="7b61523"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/ppsspp"
PKG_URL="none"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="Libretro port of PPSSPP"
PKG_LONGDESC="A fast and portable PSP emulator"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_USE_CMAKE="no"

unpack() {
  git clone --recursive $PKG_SITE $PKG_BUILD
  cd $PKG_BUILD
  git reset --hard $PKG_VERSION
  cd -
}

pre_configure_target() {
  strip_lto
  cd $PKG_BUILD
  rm -rf .$TARGET_NAME
}

make_target() {
  make -C libretro GIT_VERSION=$PKG_VERSION
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
    cp libretro/ppsspp_libretro.so $INSTALL/usr/lib/libretro
}
