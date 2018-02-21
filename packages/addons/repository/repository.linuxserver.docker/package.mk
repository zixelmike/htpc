################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="repository.linuxserver.docker"
PKG_VERSION="8.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_ADDON_PROJECTS="PC"
PKG_LICENSE="GPL"
PKG_SITE="https://linuxserver.io"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain xmlstarlet:host"
PKG_SECTION=""
PKG_SHORTDESC="LinuxServer.io docker add-on repository"
PKG_LONGDESC="LinuxServer.io docker add-on repository"
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="LinuxServer.io Repository"
PKG_ADDON_TYPE="xbmc.addon.repository"


make_target() {
  $SED -e "s|@PKG_VERSION@|$PKG_VERSION|g" \
       -e "s|@PKG_REV@|$PKG_REV|g" \
       -i addon.xml
}

makeinstall_target() {
  : # nop
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID
  cp -R $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID
}
