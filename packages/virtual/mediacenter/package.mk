################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="mediacenter"
PKG_VERSION=""
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.alexelec.in.ua"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain $MEDIACENTER"
PKG_SECTION="virtual"
PKG_SHORTDESC="Mediacenter: Metapackage"
PKG_LONGDESC=""
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

# skins
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $MEDIACENTER-theme-$SKIN_DEFAULT"
for i in $SKINS; do
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $MEDIACENTER-theme-$i"
done
  
# some python stuff needed for various addons
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET Pillow simplejson pycrypto"

# system addons
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET Common-settings Extended-settings xmlstarlet"
  
if [ "$JOYSTICK_SUPPORT" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET peripheral.joystick"
fi

if [ "$KODI_LANGUAGE_ADDONS" = "yes" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET kodi-language-addons"
fi

# pvr addons
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.hts"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.vdr.vnsi"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pvr.iptvsimple"
