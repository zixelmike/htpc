################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="common-shaders"
PKG_VERSION="0.1"
PKG_ARCH="any"
PKG_LICENSE="MIT"
PKG_SITE="https://github.com/libretro/common-shaders"
PKG_URL="none"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="Common GSLS shaders for RetroArch"
PKG_LONGDESC="Common GSLS shaders for RetroArch"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  mkdir -p $PKG_BUILD
  cd $PKG_BUILD
  wget http://buildbot.libretro.com/assets/frontend/shaders_glsl.zip
  unzip -o -d common shaders_glsl.zip
  git clone --depth 1 https://github.com/RetroPie/common-shaders.git retropie
  git clone --depth 1 https://github.com/libretro/slang-shaders.git slang
  find . -type f -exec chmod 644 {} \;
  cd -
}

configure_target() {
  : none
}

make_target() {
  : none
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/retroarch/shaders
    cp -R common/* $INSTALL/usr/share/retroarch/shaders
    cp -R retropie/retropie $INSTALL/usr/share/retroarch/shaders
    cp -R slang/* $INSTALL/usr/share/retroarch/shaders
}
