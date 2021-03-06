################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="samba"
PKG_VERSION="4.6.10"
PKG_ARCH="any"
PKG_LICENSE="GPLv3+"
PKG_SITE="https://www.samba.org"
PKG_URL="https://download.samba.org/pub/samba/stable/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain heimdal:host e2fsprogs Python zlib readline popt libaio connman"
PKG_NEED_UNPACK="$(get_pkg_directory heimdal) $(get_pkg_directory e2fsprogs)"
PKG_SECTION="network"
PKG_SHORTDESC="samba: The free SMB / CIFS fileserver and client"
PKG_LONGDESC="Samba is a SMB server that runs on Unix and other operating systems. It allows these operating systems (currently Unix, Netware, OS/2 and AmigaDOS) to act as a file and print server for SMB and CIFS clients. There are many Lan-Manager compatible clients such as LanManager for DOS, Windows for Workgroups, Windows NT, Windows 95, Linux smbfs, OS/2, Pathworks and more."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_MAKE_OPTS_TARGET="V=1"

if [ "$AVAHI_DAEMON" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET avahi"
  SMB_AVAHI="--enable-avahi"
else
  SMB_AVAHI="--disable-avahi"
fi

PKG_CONFIGURE_OPTS="--prefix=/usr \
                    --sysconfdir=/etc \
                    --localstatedir=/var \
                    --with-lockdir=/var/lock \
                    --with-logfilebase=/var/log \
                    --with-piddir=/run/samba \
                    --with-privatedir=/run/samba \
                    --with-modulesdir=/usr/lib \
                    --with-privatelibdir=/usr/lib \
                    --with-sockets-dir=/run/samba \
                    --with-configdir=/run/samba \
                    --with-libiconv=$SYSROOT_PREFIX/usr \
                    --cross-compile \
                    --cross-answers=$PKG_BUILD/cache.txt \
                    --hostcc=gcc \
                    --enable-fhs \
                    --without-dmapi \
                    --disable-glusterfs \
                    --disable-rpath \
                    --disable-rpath-install \
                    --disable-rpath-private-install \
                    $SMB_AVAHI \
                    --disable-cups \
                    --disable-iprint \
                    --disable-gnutls \
                    --with-relro \
                    --with-sendfile-support \
                    --without-acl-support \
                    --without-ads \
                    --without-ad-dc \
                    --without-automount \
                    --without-cluster-support \
                    --without-dnsupdate \
                    --without-fam \
                    --without-gettext \
                    --without-gpgme \
                    --without-iconv \
                    --without-ldap \
                    --without-pam \
                    --without-pie \
                    --without-regedit \
                    --without-systemd \
                    --without-utmp \
                    --without-winbind \
                    --enable-auto-reconfigure \
                    --bundled-libraries='ALL,!asn1_compile,!compile_et,!zlib' \
                    --without-quotas \
                    --with-syslog  \
                    --nopyc --nopyo"

PKG_SAMBA_TARGET="smbclient"

PKG_SAMBA_TARGET+=",smbd/smbd,nmbd,smbpasswd"
PKG_SAMBA_TARGET+=",client/smbclient,smbtree,testparm"

pre_configure_target() {
# samba uses its own build directory
  cd $PKG_BUILD
    rm -rf .$TARGET_NAME
# samba fails to build with gold support
  strip_gold

# work around link issues
  export LDFLAGS="$LDFLAGS -lreadline"
}

configure_target() {
  cp $PKG_DIR/config/samba4-cache.txt $PKG_BUILD/cache.txt
    echo "Checking uname machine type: \"$TARGET_ARCH\"" >> $PKG_BUILD/cache.txt

  PYTHON_CONFIG="$SYSROOT_PREFIX/usr/bin/python-config" \
  python_LDFLAGS="" python_LIBDIR="" \
  ./configure $PKG_CONFIGURE_OPTS
}

make_target() {
  ./buildtools/bin/waf build --targets=$PKG_SAMBA_TARGET -j$CONCURRENCY_MAKE_LEVEL
}

makeinstall_target() {
  ./buildtools/bin/waf install --destdir=$SYSROOT_PREFIX --targets=smbclient -j$CONCURRENCY_MAKE_LEVEL
  ./buildtools/bin/waf install --destdir=$INSTALL --targets=$PKG_SAMBA_TARGET -j$CONCURRENCY_MAKE_LEVEL
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
  rm -rf $INSTALL/usr/lib/python*
  rm -rf $INSTALL/usr/share/perl*

  mkdir -p $INSTALL/usr/lib/samba
    cp $PKG_DIR/scripts/samba-config $INSTALL/usr/lib/samba

  mkdir -p $INSTALL/etc/samba
  if [ -f $PROJECT_DIR/$PROJECT/config/smb.conf ]; then
    cp $PROJECT_DIR/$PROJECT/config/smb.conf $INSTALL/etc/samba
  elif [ -f $DISTRO_DIR/$DISTRO/config/smb.conf ]; then
    cp $DISTRO_DIR/$DISTRO/config/smb.conf $INSTALL/etc/samba
  else
    cp $PKG_DIR/config/smb.conf $INSTALL/etc/samba
    mkdir -p $INSTALL/usr/config
      cp $PKG_DIR/config/smb.conf $INSTALL/usr/config/samba.conf.sample
  fi

  mkdir -p $INSTALL/usr/bin
      cp -PR bin/default/source3/client/smbclient $INSTALL/usr/bin
      cp -PR bin/default/source3/utils/smbtree $INSTALL/usr/bin
      cp -PR bin/default/source3/utils/testparm $INSTALL/usr/bin

  if [ "$SAMBA_SERVER" = "yes" ]; then
    mkdir -p $INSTALL/usr/bin
      cp -PR bin/default/source3/utils/smbpasswd $INSTALL/usr/bin

    mkdir -p $INSTALL/usr/lib/systemd/system
      cp $PKG_DIR/system.d.opt/* $INSTALL/usr/lib/systemd/system

    mkdir -p $INSTALL/usr/share/services
      cp -P $PKG_DIR/default.d/*.conf $INSTALL/usr/share/services

    mkdir -p $INSTALL/usr/lib/samba
      cp $PKG_DIR/scripts/samba-autoshare $INSTALL/usr/lib/samba
      cp $PKG_DIR/scripts/smbd-config $INSTALL/usr/lib/samba
  fi
}

post_install() {
  enable_service samba-config.service

  if [ "$SAMBA_SERVER" = "yes" ]; then
    enable_service nmbd.service
    enable_service smbd.service
  fi
}
