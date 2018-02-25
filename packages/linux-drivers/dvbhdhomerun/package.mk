################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="dvbhdhomerun"
PKG_VERSION="20130704"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://sourceforge.net/projects/dvbhdhomerun/"
PKG_URL="${DISTRO_SRC}/${PKG_NAME}-${PKG_VERSION}.tar.xz"
#PKG_URL="$SOURCEFORGE_SRC/project/dvbhdhomerun/${PKG_NAME}_${PKG_VERSION}.tar.gz"
#PKG_SOURCE_DIR="${PKG_NAME}_${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain linux libhdhomerun"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_SECTION="driver/dvb"
PKG_SHORTDESC="A linux DVB driver for the HDHomeRun TV tuner (http://www.silicondust.com)."
PKG_LONGDESC="A linux DVB driver for the HDHomeRun TV tuner (http://www.silicondust.com)."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CMAKE_SCRIPT="userhdhomerun/CMakeLists.txt"

pre_make_target() {
  ( cd ../kernel
    LDFLAGS="" make dvb_hdhomerun KERNEL_DIR=$(kernel_path)
    fix_module_depends dvb_hdhomerun_core.ko "dvb_core"
  )
}

pre_configure_target() {

# use it here to be sure libhdhomerun is already built
  PKG_CMAKE_OPTS_TARGET="-DLIBHDHOMERUN_PATH=$(ls -d $BUILD/libhdhomerun-*/)"

# absolute path
  LIBHDHOMERUN_PATH=$(ls -d $BUILD/libhdhomerun-*/)
  sed -i "s|SET(LIBHDHOMERUN_PATH .*)|SET(LIBHDHOMERUN_PATH $LIBHDHOMERUN_PATH)|g" ../userhdhomerun/CMakeLists.txt
  sed -i "s|/etc/dvbhdhomerun|/tmp/dvbhdhomerun|g" ../userhdhomerun/hdhomerun_tuner.cpp
  sed -i "s|/etc/dvbhdhomerun|/tmp/dvbhdhomerun|g" ../userhdhomerun/hdhomerun_controller.cpp
}

makeinstall_target() {
  cd $PKG_BUILD
    mkdir -p $INSTALL/usr/lib/modules/$(get_module_dir)/hdhomerun
      cp kernel/*.ko $INSTALL/usr/lib/modules/$(get_module_dir)/hdhomerun/

    mkdir -p $INSTALL/usr/bin
      cp -PR .$TARGET_NAME/userhdhomerun $INSTALL/usr/bin
}
