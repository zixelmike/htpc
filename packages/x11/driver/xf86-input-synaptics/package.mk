################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="xf86-input-synaptics"
PKG_VERSION="1.9.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://lists.freedesktop.org/mailman/listinfo/xorg"
PKG_URL="http://xorg.freedesktop.org/archive/individual/driver/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libXi"
PKG_SECTION="x11/driver"
PKG_SHORTDESC="Synaptics touchpad driver for X.Org."
PKG_LONGDESC="Synaptics touchpad driver for X.Org."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--with-xorg-module-dir=$XORG_PATH_MODULES"
