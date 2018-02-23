################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="xmedia"
PKG_VERSION=""
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="virtual"
PKG_SHORTDESC="xmedia: Metapackage"
PKG_LONGDESC=""
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

# tv-services
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET oscam"
