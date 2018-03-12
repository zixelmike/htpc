################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vdr-plugin-skindesigner"
PKG_VERSION="5b03953f"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://projects.vdr-developer.org/projects/plg-skindesigner"
PKG_URL="https://projects.vdr-developer.org/git/$PKG_NAME.git/snapshot/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain vdr librsvg git" 
PKG_SECTION="xmedia/tvservice"
PKG_SHORTDESC="Skindesigner is a VDR skin engine that displays XML based Skins"
PKG_LONGDESC="Skindesigner is a VDR skin engine that displays XML based Skins."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"
PKG_LOCALE_INSTALL="yes"

pre_make_target() {
  # dont build parallel
  MAKEFLAGS=-j1
}

make_target() {
  : not
}

makeinstall_target() {
  make PREFIX="/usr" \
       LIBDIR=/usr/lib \
       SKINDESIGNER_SCRIPTDIR="/storage/.config/vdr/plugins/skindesigner/scripts" \
       DESTDIR="$INSTALL" \
       install

  $MAKEINSTALL \
      PREFIX="/usr" \
      SKINDESIGNER_SCRIPTDIR="/storage/.config/vdr/plugins/skindesigner/scripts"
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/vdr
    mv -f $INSTALL/usr/lib/libvdr-* $INSTALL/usr/lib/vdr
  mkdir -p $INSTALL/usr/config
    mv -f $INSTALL/storage/.config/vdr $INSTALL/usr/config
    rm -fr $INSTALL/storage
  cp -P $PKG_DIR/scripts/* $INSTALL/usr/config/vdr/plugins/skindesigner/scripts/
  mkdir -p $INSTALL/usr/config/vdr/plugins/skindesigner/logos
  echo "Skindesigner logos dir for VDR." > $INSTALL/usr/config/vdr/plugins/skindesigner/logos/README
}
