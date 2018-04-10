################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="vulkan-loader"
PKG_VERSION="1.0.68.0"
PKG_ARCH="any"
PKG_LICENSE="Apache 2.0"
PKG_SITE="https://www.khronos.org"
PKG_URL="https://github.com/KhronosGroup/Vulkan-LoaderAndValidationLayers/archive/sdk-$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="Vulkan-*$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain cmake:host"
PKG_SECTION="depends"
PKG_SHORTDESC="Vulkan Installable Client Driver (ICD) Loader."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CMAKE_OPTS_TARGET="-DBUILD_WSI_XLIB_SUPPORT=ON \
		       -DBUILD_TESTS=OFF \
		       -DBUILD_LAYERS=OFF \
		       -DBUILD_DEMOS=ON \
		       -DBUILD_VKJSON=OFF \
		       -DBUILD_WSI_WAYLAND_SUPPORT=OFF \
		       -DBUILD_WSI_MIR_SUPPORT=OFF"

pre_configure_target() {
  cd $PKG_BUILD
  ./update_external_sources.sh
}

make_target() {
  ## workaround for gcc-6
  mv -f /usr/lib/x86_64-linux-gnu/libstdc++.so.6 /usr/lib/x86_64-linux-gnu/libstdc++.so.6.org || true
  mv -f /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21 /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21.org || true
  cp -fP $SYSROOT_PREFIX/usr/lib/libstdc++.so.6 /usr/lib/x86_64-linux-gnu
  cp -fP $SYSROOT_PREFIX/usr/lib/libstdc++.so.6.0.22 /usr/lib/x86_64-linux-gnu
  ## workaround for gcc-6

  make

  ## workaround for gcc-6
  rm -f /usr/lib/x86_64-linux-gnu/libstdc++.so.6
  rm -f /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.22
  mv -f /usr/lib/x86_64-linux-gnu/libstdc++.so.6.org /usr/lib/x86_64-linux-gnu/libstdc++.so.6 || true
  mv -f /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21.org /usr/lib/x86_64-linux-gnu/libstdc++.so.6.0.21 || true
  ## workaround for gcc-6
}
