################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="xf86-input-libinput"
PKG_VERSION="0.26.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.freedesktop.org/wiki/Software/libinput/"
PKG_URL="http://xorg.freedesktop.org/archive/individual/driver/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libinput"
PKG_SECTION="x11/driver"
PKG_SHORTDESC="This is an X driver based on libinput."
PKG_LONGDESC="This is an X driver based on libinput."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--with-xorg-module-dir=$XORG_PATH_MODULES"

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/share/X11/xorg.conf.d
    cp $PKG_BUILD/conf/*-libinput.conf $INSTALL/usr/share/X11/xorg.conf.d
}
