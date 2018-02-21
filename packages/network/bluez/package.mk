################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="bluez"
PKG_VERSION="5.43"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.bluez.org/"
PKG_URL="http://www.kernel.org/pub/linux/bluetooth/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain dbus glib readline systemd"
PKG_SECTION="network"
PKG_SHORTDESC="bluez: Bluetooth Tools and System Daemons for Linux."
PKG_LONGDESC="Bluetooth Tools and System Daemons for Linux."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

if [ "$DEBUG" = "yes" ]; then
  BLUEZ_CONFIG="--enable-debug"
else
  BLUEZ_CONFIG="--disable-debug"
fi

PKG_CONFIGURE_OPTS_TARGET="--disable-dependency-tracking \
                           --disable-silent-rules \
                           --disable-library \
                           --enable-udev \
                           --disable-cups \
                           --disable-obex \
                           --enable-client \
                           --enable-systemd \
                           --enable-tools \
                           --enable-datafiles \
                           --disable-experimental \
                           --enable-sixaxis \
                           --with-gnu-ld \
                           --enable-monitor --enable-test \
                           storagedir=/storage/.cache/bluetooth"

pre_configure_target() {
# bluez fails to build in subdirs
  cd $PKG_BUILD
    rm -rf .$TARGET_NAME

  export LIBS="-ltermcap"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/lib/systemd
  rm -rf $INSTALL/usr/bin/bccmd
  rm -rf $INSTALL/usr/bin/bluemoon
  rm -rf $INSTALL/usr/bin/ciptool
  rm -rf $INSTALL/usr/share/dbus-1

  mkdir -p $INSTALL/etc/bluetooth
    cp src/main.conf $INSTALL/etc/bluetooth
    sed -i $INSTALL/etc/bluetooth/main.conf \
        -e "s|^#\[Policy\]|\[Policy\]|g" \
        -e "s|^#AutoEnable.*|AutoEnable=true|g"
}

post_install() {
  enable_service bluetooth.service
  enable_service obex.service
}
