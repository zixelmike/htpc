################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.ru
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.ru)
################################################################################

PKG_NAME="mc"
PKG_VERSION="4.8.19"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.midnight-commander.org/"
PKG_URL="http://ftp.midnight-commander.org/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain libtool:host gettext:host glib pcre slang"
PKG_SECTION="xmedia/tools"
PKG_SHORTDESC="Midnight Commander is a visual file manager"
PKG_LONGDESC="Midnight Commander is a visual file manager."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_TARGET="--sysconfdir=/etc \
            --disable-doxygen-doc \
            --disable-doxygen-dot \
            --disable-doxygen-html \
            --with-sysroot=$SYSROOT_PREFIX \
            --with-screen=slang \
            --without-gpm-mouse \
            --without-x \
            --enable-charset \
            --enable-background \
            --with-gnu-ld \
            --without-libiconv-prefix \
            --without-libintl-prefix \
            --with-internal-edit \
            --with-subshell"

post_makeinstall_target() {
  rm -rf $INSTALL/etc/mc
  mkdir -p  $INSTALL/usr/config/mc
    cp -a $PKG_DIR/etc/* $INSTALL/usr/config/mc
    ln -sf /storage/.config/mc $INSTALL/etc/mc
}
