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

PKG_CMAKE_OPTS_TARGET="-DBUILD_WSI_XLIB_SUPPORT=On \
		       -DBUILD_TESTS=Off \
		       -DBUILD_LAYERS=Off \
		       -DBUILD_DEMOS=On \
		       -DBUILD_VKJSON=Off \
		       -DBUILD_WSI_WAYLAND_SUPPORT=Off \
		       -DBUILD_WSI_MIR_SUPPORT=Off"

pre_configure_target() {
  cd ..
  ./update_external_sources.sh
  cd -
}
