################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="retroarch"
PKG_VERSION="ab00d58"
PKG_ARCH="any"
PKG_LICENSE="GPLv3"
PKG_SITE="https://github.com/libretro/RetroArch"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="RetroArch*"
PKG_DEPENDS_TARGET="toolchain mesa vulkan-loader samba avahi nss-mdns ffmpeg alsa-lib freetype zlib retroarch-assets core-info retroarch-joypad-autoconfig common-shaders libretro-database buildbot-cores snappy"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="Reference frontend for the libretro API."
PKG_LONGDESC="RetroArch is the reference frontend for the libretro API. Popular examples of implementations for this API includes videogame system emulators and game engines, but also more generalized 3D programs. These programs are instantiated as dynamic libraries. We refer to these as libretro cores."
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

  RA_PLAYLIST_NAMES=""\
"Atari - 2600.lpl;"\
"Atari - 5200.lpl;"\
"Atari - 7800.lpl;"\
"Atari - Jaguar.lpl;"\
"Atari - Lynx.lpl;"\
"Atari - ST.lpl;"\
"Bandai - WonderSwan Color.lpl;"\
"Bandai - WonderSwan.lpl;"\
"Cave Story.lpl;"\
"ChaiLove.lpl;"\
"Coleco - ColecoVision.lpl;"\
"Commodore - 64 (PP).lpl;"\
"Commodore - 64 (Tapes).lpl;"\
"Commodore - 64.lpl;"\
"Commodore - Amiga.lpl;"\
"Commodore - Plus-4.lpl;"\
"Commodore - VIC20.lpl;"\
"Dinothawr.lpl;"\
"DOOM.lpl;"\
"DOS.lpl;"\
"FB Alpha - Arcade Games.lpl;"\
"GCE - Vectrex.lpl;"\
"Lutro.lpl;"\
"Magnavox - Odyssey2.lpl;"\
"MAME.lpl;"\
"Mattel - Intellivision.lpl;"\
"Microsoft - MSX2.lpl;"\
"Microsoft - MSX.lpl;"\
"NEC - PC Engine SuperGrafx.lpl;"\
"NEC - PC Engine - TurboGrafx 16.lpl;"\
"Nintendo - Famicom Disk System.lpl;"\
"Nintendo - Game Boy Advance (e-Cards).lpl;"\
"Nintendo - Game Boy Advance.lpl;"\
"Nintendo - Game Boy Color.lpl;"\
"Nintendo - Game Boy.lpl;"\
"Nintendo - GameCube.lpl;"\
"Nintendo - Nintendo 64.lpl;"\
"Nintendo - Nintendo DS.lpl;"\
"Nintendo - Nintendo DS Decrypted.lpl;"\
"Nintendo - Nintendo DS (Download Play) (BETA).lpl;"\
"Nintendo - Nintendo DSi Decrypted.lpl;"\
"Nintendo - Nintendo DSi (DLC).lpl;"\
"Nintendo - Nintendo Entertainment System.lpl;"\
"Nintendo - Satellaview.lpl;"\
"Nintendo - Super Nintendo Entertainment System.lpl;"\
"Nintendo - Virtual Boy.lpl;"\
"Quake1.lpl;"\
"ScummVM.lpl;"\
"Sega - 32X.lpl;"\
"Sega - Game Gear.lpl;"\
"Sega - Master System - Mark III.lpl;"\
"Sega - Mega Drive - Genesis.lpl;"\
"Sega - PICO.lpl;"\
"Sega - SG-1000.lpl;"\
"Sinclair - ZX Spectrum +3.lpl;"\
"SNK - Neo Geo Pocket Color.lpl;"\
"SNK - Neo Geo Pocket.lpl;"\
"Sony - PlayStation Portable.lpl;"\
"Sony - PlayStation.lpl"

  RA_PLAYLIST_CORES=""\
"/tmp/cores/stella_libretro.so;"\
"/tmp/cores/atari800_libretro.so;"\
"/tmp/cores/prosystem_libretro.so;"\
"/tmp/cores/virtualjaguar_libretro.so;"\
"/tmp/cores/handy_libretro.so;"\
"/tmp/cores/hatari_libretro.so;"\
"/tmp/cores/mednafen_wswan_libretro.so;"\
"/tmp/cores/mednafen_wswan_libretro.so;"\
"/tmp/cores/nxengine_libretro.so;"\
"/tmp/cores/chailove_libretro.so;"\
"/tmp/cores/bluemsx_libretro.so;"\
"/tmp/cores/vice_x64_libretro.so;"\
"/tmp/cores/vice_x64_libretro.so;"\
"/tmp/cores/vice_x64_libretro.so;"\
"/tmp/cores/puae_libretro.so;"\
"/tmp/cores/vice_xplus4_libretro.so;"\
"/tmp/cores/vice_xvic_libretro.so;"\
"/tmp/cores/dinothawr_libretro.so;"\
"/tmp/cores/prboom_libretro.so;"\
"/tmp/cores/dosbox_libretro.so;"\
"/tmp/cores/fbalpha_libretro.so;"\
"/tmp/cores/vecx_libretro.so;"\
"/tmp/cores/lutro_libretro.so;"\
"/tmp/cores/o2em_libretro.so;"\
"/tmp/cores/mame_libretro.so;"\
"/tmp/cores/freeintv_libretro.so;"\
"/tmp/cores/bluemsx_libretro.so;"\
"/tmp/cores/bluemsx_libretro.so;"\
"/tmp/cores/mednafen_supergrafx_libretro.so;"\
"/tmp/cores/mednafen_pce_fast_libretro.so;"\
"/tmp/cores/nestopia_libretro.so;"\
"/tmp/cores/mgba_libretro.so;"\
"/tmp/cores/mgba_libretro.so;"\
"/tmp/cores/gambatte_libretro.so;"\
"/tmp/cores/gambatte_libretro.so;"\
"/tmp/cores/dolphin_libretro.so;"\
"/tmp/cores/parallel_n64_libretro.so;"\
"/tmp/cores/desmume_libretro.so;"\
"/tmp/cores/desmume_libretro.so;"\
"/tmp/cores/desmume_libretro.so;"\
"/tmp/cores/desmume_libretro.so;"\
"/tmp/cores/desmume_libretro.so;"\
"/tmp/cores/nestopia_libretro.so;"\
"/tmp/cores/snes9x2010_libretro.so;"\
"/tmp/cores/snes9x2010_libretro.so;"\
"/tmp/cores/mednafen_vb_libretro.so;"\
"/tmp/cores/tyrquake_libretro.so;"\
"/tmp/cores/scummvm_libretro.so;"\
"/tmp/cores/picodrive_libretro.so;"\
"/tmp/cores/genesis_plus_gx_libretro.so;"\
"/tmp/cores/genesis_plus_gx_libretro.so;"\
"/tmp/cores/genesis_plus_gx_libretro.so;"\
"/tmp/cores/picodrive_libretro.so;"\
"/tmp/cores/genesis_plus_gx_libretro.so;"\
"/tmp/cores/fuse_libretro.so;"\
"/tmp/cores/mednafen_ngp_libretro.so;"\
"/tmp/cores/mednafen_ngp_libretro.so;"\
"/tmp/cores/ppsspp_libretro.so;"\
"/tmp/cores/pcsx_rearmed_libretro.so"

TARGET_CONFIGURE_OPTS=""
PKG_CONFIGURE_OPTS_TARGET="--disable-vg \
                           --disable-sdl \
						   --disable-xvideo \
                           --disable-al \
                           --disable-oss \
                           --enable-kms \
                           --enable-vulkan \
						   --enable-zlib \
                           --host=$TARGET_NAME \
                           --enable-freetype"

pre_configure_target() {
  strip_lto
  cd $PKG_BUILD
  rm -rf .$TARGET_NAME
  export PKG_CONF_PATH=$TOOLCHAIN/bin/pkg-config
  echo $PKG_VERSION > .gitversion
}

make_target() {
  make V=1 HAVE_ZARCH=0
  make -C gfx/video_filters compiler=$CC extra_flags="$CFLAGS"
  make -C libretro-common/audio/dsp_filters compiler=$CC extra_flags="$CFLAGS"
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
    cp $PKG_BUILD/retroarch $INSTALL/usr/bin
  mkdir -p $INSTALL/usr/share/video_filters
    cp $PKG_BUILD/gfx/video_filters/*.so $INSTALL/usr/share/video_filters
    cp $PKG_BUILD/gfx/video_filters/*.filt $INSTALL/usr/share/video_filters
  mkdir -p $INSTALL/usr/share/audio_filters
    cp $PKG_BUILD/libretro-common/audio/dsp_filters/*.so $INSTALL/usr/share/audio_filters
    cp $PKG_BUILD/libretro-common/audio/dsp_filters/*.dsp $INSTALL/usr/share/audio_filters
  mkdir -p $INSTALL/etc
    cp $PKG_BUILD/retroarch.cfg $INSTALL/etc
  mkdir -p $INSTALL/usr/config/retroarch
    cp $PKG_DIR/config/retroarch* $INSTALL/usr/config/retroarch

  # General configuration
  sed -i -e "s/# libretro_directory =/libretro_directory = \"\/tmp\/cores\"/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# libretro_info_path =/libretro_info_path = \"\/tmp\/cores\"/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# content_database_path =/content_database_path =\/tmp\/database\/rdb/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# cheat_database_path =/cheat_database_path =\/tmp\/database\/cht/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# rgui_browser_directory =/rgui_browser_directory =\/storage\/roms/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_shader_dir =/video_shader_dir =\/tmp\/shaders/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# rgui_show_start_screen = true/rgui_show_start_screen = false/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# assets_directory =/assets_directory =\/tmp\/assets/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# menu_driver = \"rgui\"/menu_driver = \"xmb\"/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_shared_context = false/video_shared_context = true/" $INSTALL/etc/retroarch.cfg
  echo 'cursor_directory = "/tmp/database/cursors"' >> $INSTALL/etc/retroarch.cfg
  echo 'recording_output_directory = "/storage/videos"' >> $INSTALL/etc/retroarch.cfg
  echo 'system_directory = "/storage/roms/bios"' >> $INSTALL/etc/retroarch.cfg
  
  # Video
  sed -i -e "s/# video_smooth = true/video_smooth = false/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_aspect_ratio_auto = false/video_aspect_ratio_auto = true/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_threaded = false/video_threaded = true/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_font_size = 48/video_font_size = 32/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_filter_dir =/video_filter_dir =\/usr\/share\/retroarch\/video_filters/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# video_gpu_screenshot = true/video_gpu_screenshot = false/" $INSTALL/etc/retroarch.cfg

  # Audio
  sed -i -e "s/# audio_driver =/audio_driver = \"alsathread\"/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# audio_filter_dir =/audio_filter_dir =\/usr\/share\/retroarch\/audio_filters/" $INSTALL/etc/retroarch.cfg
  
  # Input
  sed -i -e "s/# input_driver = sdl/input_driver = udev/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# input_max_users =/input_max_users = 5/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# input_autodetect_enable = true/input_autodetect_enable = true/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# joypad_autoconfig_dir =/joypad_autoconfig_dir = \/tmp\/joypads/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# input_remapping_directory =/input_remapping_directory = \/storage\/.config\/retroarch\/remappings/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# input_menu_toggle_gamepad_combo =/input_menu_toggle_gamepad_combo = \"2\"/" $INSTALL/etc/retroarch.cfg

  # Menu
  sed -i -e "s/# menu_core_enable = true/menu_core_enable = false/" $INSTALL/etc/retroarch.cfg
  sed -i -e "s/# thumbnails_directory =/thumbnails_directory = \/storage\/.config\/retroarch\/thumbnails/" $INSTALL/etc/retroarch.cfg

  # Playlists
  echo "playlist_names = \"$RA_PLAYLIST_NAMES\"" >> $INSTALL/etc/retroarch.cfg
  echo "playlist_cores = \"$RA_PLAYLIST_CORES\"" >> $INSTALL/etc/retroarch.cfg
}

post_install() {  
  enable_service tmp-assets.mount
  enable_service tmp-cores.mount
  enable_service tmp-database.mount
  enable_service tmp-joypads.mount
  enable_service tmp-shaders.mount
}
