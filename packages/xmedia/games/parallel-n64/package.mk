################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="parallel-n64"
PKG_VERSION="38e073f"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/parallel-n64"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="parallel-n64: Libretro port of Mupen64 Plus."
PKG_LONGDESC="parallel-n64 for libretro with multiple graphic plugins and vulkan support."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_target() {
  strip_lto
}

pre_build_target() {
  export GIT_VERSION=$PKG_VERSION
  export LDFLAGS="$LDFLAGS -lpthread"
}

make_target() {
  LDFLAGS="$LDFLAGS -lpthread"
  make WITH_DYNAREC=$TARGET_ARCH HAVE_PARALLEL=0
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
    cp `find . -name "*.so" | xargs echo` $INSTALL/usr/lib/libretro/
}
