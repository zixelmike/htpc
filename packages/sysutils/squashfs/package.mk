################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="squashfs"
PKG_VERSION="4.3"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://squashfs.sourceforge.net/"
PKG_URL="$SOURCEFORGE_SRC/squashfs/squashfs/${PKG_NAME}${PKG_VERSION}/${PKG_NAME}${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="${PKG_NAME}${PKG_VERSION}"
PKG_DEPENDS_HOST="ccache:host zlib:host lzo:host xz:host zstd:host"
PKG_SECTION="sysutils"
PKG_SHORTDESC="squashfs-tools: A compressed read-only filesystem for Linux"
PKG_LONGDESC="Squashfs is intended to be a general read-only filesystem, for archival use (i.e. in cases where a .tar.gz file may be used), and in constrained block device/memory systems (e.g. embedded systems) where low overhead is needed. The filesystem is currently stable and has been tested on PowerPC, i386, SPARC and ARM architectures."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_host() {
  make -C squashfs-tools mksquashfs \
       XZ_SUPPORT=1 LZO_SUPPORT=1 ZSTD_SUPPORT=1 \
       INCLUDEDIR="-I. -I$TOOLCHAIN/include"
}

makeinstall_host() {
  mkdir -p $TOOLCHAIN/bin
    cp squashfs-tools/mksquashfs $TOOLCHAIN/bin
}
