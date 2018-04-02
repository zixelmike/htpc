################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="ffmpegx"
PKG_VERSION="3.4.2"
PKG_ARCH="any"
PKG_LICENSE="LGPLv2.1+"
PKG_SITE="https://ffmpeg.org"
PKG_URL="https://github.com/FFmpeg/FFmpeg/archive/n${PKG_VERSION}.tar.gz"
PKG_SOURCE_DIR="FFmpeg-n${PKG_VERSION}"
PKG_DEPENDS_TARGET="toolchain bzip2 fdk-aac libvorbis openssl opus x264 x265 libvpx zlib libxcb libX11"
PKG_SECTION="xmedia/depends"
PKG_LONGDESC="FFmpegx is an complete FFmpeg build to support encoding and decoding"
PKG_AUTORECONF="no"

pre_configure_target() {
  cd $PKG_BUILD
  rm -rf .$TARGET_NAME

# ffmpeg builds better with these options
  strip_gold
  strip_lto

# HW encoders
  PKG_FFMPEG_HW_ENCODERS="\
    `#Video encoders` \
    --enable-encoder=h264_nvenc \
    --enable-encoder=h264_vaapi \
    --enable-encoder=hevc_nvenc \
    --enable-encoder=hevc_vaapi \
    --enable-encoder=mjpeg_vaapi \
    --enable-encoder=mpeg2_vaapi \
    --enable-encoder=vp8_vaapi \
    --enable-encoder=vp9_vaapi \
    \
    `#Video hwaccel` \
    --enable-hwaccel=h263_vaapi \
    --enable-hwaccel=h264_vaapi \
    --enable-hwaccel=hevc_vaapi \
    --enable-hwaccel=mpeg2_vaapi \
    --enable-hwaccel=mpeg4_vaapi \
    --enable-hwaccel=vc1_vaapi \
    --enable-hwaccel=vp9_vaapi \
    --enable-hwaccel=wmv3_vaapi"

# X11 grab for screen recording
  PKG_FFMPEG_LIBS="$PKG_FFMPEG_LIBS -lX11"
  PKG_FFMPEG_X11_GRAB="\
    --enable-libxcb \
    --enable-libxcb-shm \
    --enable-libxcb-xfixes \
    --enable-libxcb-shape"
}

configure_target() {
  ./configure \
    \
    `#Programs to build` \
    --enable-ffmpeg \
    --disable-ffplay \
    --enable-ffprobe \
    --disable-ffserver \
    \
    `#Static and Shared` \
    --enable-static \
    --disable-shared \
    \
    `#Licensing options` \
    --enable-gpl \
    --enable-nonfree \
    \
    `#Documentation options` \
    --disable-doc \
    \
    `#Hardware accelerated decoding encoding` \
    $PKG_FFMPEG_HW_ENCODERS \
    \
    `#General options` \
    --enable-avresample \
    --disable-lzma \
    --disable-alsa \
    $PKG_FFMPEG_X11_GRAB \
    \
    `#Toolchain options` \
    --arch="$TARGET_ARCH" \
    --cpu="$TARGET_CPU" \
    --cross-prefix="$TARGET_PREFIX" \
    --enable-cross-compile \
    --sysroot="$SYSROOT_PREFIX" \
    --sysinclude="$SYSROOT_PREFIX/usr/include" \
    --target-os="linux" \
    --nm="$NM" \
    --ar="$AR" \
    --as="$CC" \
    --cc="$CC" \
    --ld="$CC" \
    --pkg-config="$TOOLCHAIN/bin/pkg-config" \
    --host-cc="$HOST_CC" \
    --host-cflags="$HOST_CFLAGS" \
    --host-ldflags="$HOST_LDFLAGS" \
    --host-extralibs="-lm" \
    --extra-cflags="$CFLAGS" \
    --extra-ldflags="$LDFLAGS" \
    --extra-libs="$PKG_FFMPEG_LIBS" \
    --extra-version="x" \
    --enable-pic \
    --enable-openssl \

}

makeinstall_target() {
  make install DESTDIR="$INSTALL/../.INSTALL_PKG"
}

post_makeinstall_target() {
  for ff in "$INSTALL/../.INSTALL_PKG/usr/local/bin/"*; do mv "$ff" "${ff}x"; done
}
