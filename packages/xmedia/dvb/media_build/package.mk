################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="media_build"
PKG_VERSION="20180305"
GIT_VERSION="43daeda"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://bitbucket.org/CrazyCat/media_build"
PKG_SITE="https://github.com/crazycat69/linux_media"
PKG_URL="$ALEXELEC_SRC/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain linux"
PKG_BUILD_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="xmedia/dvb"
PKG_SHORTDESC="DVB drivers that replace the version shipped with the kernel"
PKG_LONGDESC="DVB drivers that replace the version shipped with the kernel"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_make_target() {
  export KERNEL_VER=$(get_module_dir)
  export LDFLAGS=""
}

make_target() {
  make VER=$KERNEL_VER SRCDIR=$(kernel_path) stagingconfig
  # Geniatech T220A
  sed -i -e "s|^.*CONFIG_DVB_CXD2820R.*$|CONFIG_DVB_CXD2820R=m|" "v4l/.config"
  make VER=$KERNEL_VER SRCDIR=$(kernel_path)
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/modules/$KERNEL_VER/updates
  find $PKG_BUILD/v4l/ -name \*.ko -exec cp {} $INSTALL/usr/lib/modules/$KERNEL_VER/updates \;
  echo "Media_Build CrazyCat drivers version: $PKG_VERSION~git:$GIT_VERSION" > $INSTALL/usr/lib/modules/$KERNEL_VER/updates/01-version.txt
}
