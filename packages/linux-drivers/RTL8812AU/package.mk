################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="RTL8812AU"
PKG_VERSION="da70677"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/paspro/rtl8812au"
PKG_URL="https://github.com/paspro/rtl8812au/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="rtl8812au-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver"
PKG_SHORTDESC="Realtek RTL8812AU Linux 3.x driver"
PKG_LONGDESC="Realtek RTL8812AU Linux 3.x driver"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=$TARGET_KERNEL_ARCH \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=$TARGET_PREFIX \
       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/modules/$(get_module_dir)/$PKG_NAME
    cp *.ko $INSTALL/usr/lib/modules/$(get_module_dir)/$PKG_NAME
}
