################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="xf86-video-amdgpu"
PKG_VERSION="1.4.0"
PKG_ARCH="x86_64"
PKG_LICENSE="OSS"
PKG_SITE="http://www.x.org/"
PKG_URL="http://xorg.freedesktop.org/archive/individual/driver/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain xorg-server"
PKG_SECTION="x11/driver"
PKG_SHORTDESC="xf86-video-amdgpu - AMD Radeon video driver for the Xorg X server"
PKG_LONGDESC="AMD Xorg video driver"
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--enable-udev \
                           --enable-glamor \
                           --with-xorg-module-dir=$XORG_PATH_MODULES"

post_makeinstall_target() {
  rm -r $INSTALL/usr/share
  mkdir -p $INSTALL/etc/X11
    cp $PKG_BUILD/conf/10-amdgpu.conf $INSTALL/etc/X11/xorg-amdgpu.conf
}
