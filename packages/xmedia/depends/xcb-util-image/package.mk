################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.ru
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.ru)
################################################################################

PKG_NAME="xcb-util-image"
PKG_VERSION="0.4.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://xcb.freedesktop.org"
PKG_URL="http://xcb.freedesktop.org/dist/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain xcb-util"
PKG_SECTION="xmedia/depends"
PKG_SHORTDESC="utility libraries for X C Binding -- image"
PKG_LONGDESC="This package contains the library files needed to run software using libxcb-image, providing port of Xlib's XImage and XShmImage functions."
PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"
