################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="llvm"
PKG_VERSION="5.0.1"
PKG_ARCH="x86_64"
PKG_LICENSE="GPL"
PKG_SITE="http://llvm.org/"
PKG_URL="http://llvm.org/releases/$PKG_VERSION/${PKG_NAME}-${PKG_VERSION}.src.tar.xz"
PKG_SOURCE_DIR="${PKG_NAME}-${PKG_VERSION}.src"
PKG_DEPENDS_TARGET="toolchain llvm:host zlib"
PKG_SECTION="lang"
PKG_SHORTDESC="llvm: Low Level Virtual Machine"
PKG_LONGDESC="Low-Level Virtual Machine (LLVM) is a compiler infrastructure designed for compile-time, link-time, run-time, and idle-time optimization of programs from arbitrary programming languages. It currently supports compilation of C, Objective-C, and C++ programs, using front-ends derived from GCC 4.0, GCC 4.2, and a custom new front-end, "clang". It supports x86, x86-64, ia64, PowerPC, and SPARC, with support for Alpha and ARM under development."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CMAKE_OPTS_HOST="-DLLVM_INCLUDE_TOOLS=ON \
                     -DLLVM_BUILD_TOOLS=OFF \
                     -DLLVM_BUILD_UTILS=OFF \
                     -DLLVM_BUILD_EXAMPLES=OFF \
                     -DLLVM_INCLUDE_EXAMPLES=OFF \
                     -DLLVM_BUILD_TESTS=OFF \
                     -DLLVM_INCLUDE_TESTS=OFF \
                     -DLLVM_INCLUDE_GO_TESTS=OFF \
                     -DLLVM_BUILD_DOCS=OFF \
                     -DLLVM_INCLUDE_DOCS=OFF \
                     -DLLVM_ENABLE_DOXYGEN=OFF \
                     -DLLVM_ENABLE_SPHINX=OFF \
                     -DLLVM_TARGETS_TO_BUILD="AMDGPU" \
                     -DLLVM_ENABLE_TERMINFO=OFF \
                     -DLLVM_ENABLE_ASSERTIONS=OFF \
                     -DLLVM_ENABLE_WERROR=OFF \
                     -DLLVM_ENABLE_ZLIB=OFF \
                     -DLLVM_OPTIMIZED_TABLEGEN=ON \
                     -DCMAKE_INSTALL_RPATH=$TOOLCHAIN/lib \
                     -DLLVM_APPEND_VC_REV=OFF"

make_host() {
  make llvm-config llvm-tblgen
}

makeinstall_host() {
  cp -a bin/llvm-config $SYSROOT_PREFIX/usr/bin/llvm-config-host
  cp -a bin/llvm-tblgen $TOOLCHAIN/bin
}

PKG_CMAKE_OPTS_TARGET="-DCMAKE_BUILD_TYPE=MinSizeRel \
                       -DCMAKE_C_FLAGS="$CFLAGS" \
                       -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
                       -DLLVM_INCLUDE_TOOLS=ON \
                       -DLLVM_BUILD_TOOLS=OFF \
                       -DLLVM_BUILD_UTILS=ON \
                       -DLLVM_BUILD_EXAMPLES=OFF \
                       -DLLVM_INCLUDE_EXAMPLES=OFF \
                       -DLLVM_BUILD_TESTS=OFF \
                       -DLLVM_INCLUDE_TESTS=OFF \
                       -DLLVM_INCLUDE_GO_TESTS=OFF \
                       -DLLVM_BUILD_DOCS=OFF \
                       -DLLVM_INCLUDE_DOCS=OFF \
                       -DLLVM_ENABLE_DOXYGEN=OFF \
                       -DLLVM_ENABLE_SPHINX=OFF \
                       -DLLVM_TARGETS_TO_BUILD="AMDGPU" \
                       -DLLVM_ENABLE_TERMINFO=OFF \
                       -DLLVM_ENABLE_ASSERTIONS=OFF \
                       -DLLVM_ENABLE_WERROR=OFF \
                       -DLLVM_TARGET_ARCH="$TARGET_ARCH" \
                       -DLLVM_ENABLE_ZLIB=ON \
                       -DLLVM_BUILD_LLVM_DYLIB=ON \
                       -DLLVM_LINK_LLVM_DYLIB=ON \
                       -DLLVM_OPTIMIZED_TABLEGEN=ON \
                       -DLLVM_TABLEGEN=$TOOLCHAIN/bin/llvm-tblgen \
                       -DLLVM_APPEND_VC_REV=OFF"

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
  rm -rf $INSTALL/usr/lib/LLVMHello.so
  rm -rf $INSTALL/usr/lib/libLTO.so
  rm -rf $INSTALL/usr/share
}
