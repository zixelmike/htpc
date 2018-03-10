################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="HTTPAceProxy"
PKG_VERSION="4e95af6"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/pepsik-kiev/HTTPAceProxy"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain gevent psutil requests M2Crypto"
PKG_SECTION="xmedia/torrent"
PKG_SHORTDESC="AceProxy: Ace Stream HTTP Proxy"
PKG_LONGDESC="AceProxy: Ace Stream HTTP Proxy."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : # nothing to make here
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/config/aceproxy
    cp -PR aceclient \
           plugins \
           *.py \
           $INSTALL/usr/config/aceproxy

  mkdir -p $INSTALL/usr/bin
    cp $PKG_DIR/scripts/* $INSTALL/usr/bin
}

post_install() {
  enable_service aceproxy.service
}
