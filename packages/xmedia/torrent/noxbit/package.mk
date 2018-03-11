################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="noxbit"
PKG_VERSION="18.02.13"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://noxbit.com/"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/torrent"
PKG_SHORTDESC="NoxBit: Meet the New Generation of Live Video Streaming"
PKG_LONGDESC="NoxBit: Meet the New Generation of Live Video Streaming."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/noxbit
    cp $PKG_DIR/config/* $INSTALL/usr/config/noxbit
  mkdir -p $INSTALL/usr/bin
    ln -sf /storage/.config/noxbit/bin/STM-Agent $INSTALL/usr/bin/STM-Agent
    ln -sf /storage/.config/noxbit/bin/STM-Downloader $INSTALL/usr/bin/STM-Downloader
    ln -sf /storage/.config/noxbit/bin/STM-Hypervisor $INSTALL/usr/bin/STM-Hypervisor
}

post_install() {
  enable_service noxbit.service
}
