################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.ru
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.ru)
################################################################################

PKG_NAME="slang"
PKG_VERSION="2.2.4"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://s-lang.org/"
PKG_URL="ftp://ftp.fu-berlin.de/pub/unix/misc/slang/v2.2/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="devel"
PKG_SHORTDESC="slang: library for the S-Lang extension language"
PKG_LONGDESC="S-Lang is an interpreted language and a programming library.  The S-Lang language was designed so that it can be easily embedded into a program to provide the program with a powerful extension language.  The S-Lang library, provided in this package, provides the S-Lang extension language.  S-Lang's syntax resembles C, which makes it easy to recode S-Lang procedures in C if you need to."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

MAKEFLAGS=-j1

PKG_CONFIGURE_OPTS_TARGET="--without-onig"

pre_configure_target() {
 # slang fails to build in subdirs
 cd $PKG_BUILD
 rm -rf .$TARGET_NAME
}

pre_configure_host() {
 # slang fails to build in subdirs
 cd $PKG_BUILD
 rm -rf .$HOST_NAME
}
