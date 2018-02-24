################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="libdrm"
PKG_VERSION="2.4.90"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://dri.freedesktop.org"
PKG_URL="http://dri.freedesktop.org/libdrm/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libpthread-stubs libpciaccess"
PKG_SECTION="graphics"
PKG_SHORTDESC="libdrm: Userspace interface to kernel DRM services"
PKG_LONGDESC="The userspace interface library to kernel DRM services."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

get_graphicdrivers

DRM_CONFIG="--disable-libkms --disable-intel --disable-radeon --disable-amdgpu"
DRM_CONFIG="$DRM_CONFIG --disable-nouveau --disable-vmwgfx"

for drv in $GRAPHIC_DRIVERS; do
  [ "$drv" = "i915" -o "$drv" = "i965" ] && \
    DRM_CONFIG=`echo $DRM_CONFIG | sed -e 's/disable-libkms/enable-libkms/'` && \
    DRM_CONFIG=`echo $DRM_CONFIG | sed -e 's/disable-intel/enable-intel/'`

  [ "$drv" = "r200" -o "$drv" = "r300" -o "$drv" = "r600" -o "$drv" = "radeonsi" ] && \
    DRM_CONFIG=`echo $DRM_CONFIG | sed -e 's/disable-libkms/enable-libkms/'` && \
    DRM_CONFIG=`echo $DRM_CONFIG | sed -e 's/disable-radeon/enable-radeon/'` && \
    DRM_CONFIG=`echo $DRM_CONFIG | sed -e 's/disable-amdgpu/enable-amdgpu/'`

  [ "$drv" = "vmware" ] && \
    DRM_CONFIG=`echo $DRM_CONFIG | sed -e 's/disable-libkms/enable-libkms/'` && \
    DRM_CONFIG=`echo $DRM_CONFIG | sed -e 's/disable-vmwgfx/enable-vmwgfx/'`
done

PKG_CONFIGURE_OPTS_TARGET="--disable-udev \
                           --enable-largefile \
                           --with-kernel-source=$(kernel_path) \
                           $DRM_CONFIG \
                           --disable-install-test-programs \
                           --disable-cairo-tests \
                           --disable-manpages \
                           --disable-valgrind"
