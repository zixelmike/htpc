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

# tools
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mc scan-m3u scan-s2 wget ImageMagick"

# tv-services
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET tvheadend oscam vdr"

# vdr-plugins
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-channelscan"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-dvbapi"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-epgsearch"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-epgsync"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-femon"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-iptv"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-live"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-satip"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-skindesigner"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-sleeptimer"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-softhddevice"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-streamdev"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-svdrpservice"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-systeminfo"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-tvguideng"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-tvscraper"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-vnsiserver"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-weatherforecast"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-xmltv2vdr"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET vdr-plugin-zaphistory"

# torrents
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET aceproxy"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET noxbit"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET transmission"

# games
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET retroarch"
PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET ppsspp"
