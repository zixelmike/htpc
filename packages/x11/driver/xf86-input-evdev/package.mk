################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="xf86-input-evdev"
PKG_VERSION="2.10.4"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://www.X.org"
PKG_URL="http://xorg.freedesktop.org/archive/individual/driver/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain util-macros inputproto libevdev mtdev systemd"
PKG_SECTION="x11/driver"
PKG_SHORTDESC="xf86-input-evdev: Generic Xorg Linux input driver"
PKG_LONGDESC="Evdev is an Xorg input driver for Linux's generic event devices. It therefore supports all input devices that the kernel knows about, including most mice and keyboards."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-silent-rules \
                           --with-xorg-module-dir=$XORG_PATH_MODULES \
                           --with-gnu-ld"
