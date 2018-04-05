################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="buildbot-cores"
PKG_VERSION="0.1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="http://buildbot.libretro.com"
PKG_URL="none"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="libretro cores from buildbot.libretro.com"
PKG_LONGDESC="libretro cores for RetroArch"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  mkdir -p $PKG_BUILD
  cd $PKG_BUILD
  wget -e robots=off -r -nH --cut-dirs=4 --no-parent --reject="index.html*" http://buildbot.libretro.com/nightly/linux/x86_64/latest/
  rm -f mame201* mame2000* mame_* ume20* mess* fb_* bsnes_[a-c,p]* puae* snes9x_lib* stella* dinothawr* mednafen_psx_hw* virtual_jaguar*
  for a in *.zip; do unzip $a; done
  cd -
}

configure_target() {
  : none
}

make_target() {
  : none
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
    cp *.so $INSTALL/usr/lib/libretro
}
