################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="distutilscross"
PKG_VERSION="0.1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://bitbucket.org/lambacck/distutilscross/"
PKG_URL="http://pypi.python.org/packages/source/d/distutilscross/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="Python:host setuptools:host"
PKG_SECTION="python/devel"
PKG_SHORTDESC="distutilscross: Cross Compile Python Extensions"
PKG_LONGDESC="distutilscross enhances distutils to support Cross Compile of Python extensions"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_host() {
 : # nothing todo
}

makeinstall_host() {
  python setup.py install --prefix=$TOOLCHAIN
}
