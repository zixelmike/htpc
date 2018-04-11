################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="pcsx_rearmed"
PKG_VERSION="aa45a57"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/pcsx_rearmed"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="pcsx_rearmed-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="ARM optimized PCSX fork"
PKG_LONGDESC="PCSX ReARMed is yet another PCSX fork based on the PCSX-Reloaded project, which itself contains code from PCSX, PCSX-df and PCSX-Revolution."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

configure_target() {
  strip_gold
  cd $PKG_BUILD
  rm -rf .$TARGET_NAME
}

pre_build_target() {
  export GIT_VERSION=$PKG_VERSION
}

make_target() {
   make -f Makefile.libretro
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
    cp `find . -name "*.so" | xargs echo` $INSTALL/usr/lib/libretro
}
