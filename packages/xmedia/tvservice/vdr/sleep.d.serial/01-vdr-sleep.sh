#!/bin/sh
################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

SERVICE="vdr.service"
LOCK_DIR="/var/lock"

case $1 in
  pre)
    if [ -f "$LOCK_DIR/sleep.vdr" ] ; then
      systemctl stop "$SERVICE"
    fi
    ;;
  post)
    if [ -f "$LOCK_DIR/sleep.vdr" ] ; then
      rm -f $LOCK_DIR/sleep.vdr
      touch $LOCK_DIR/start.vdr
      systemctl start "$SERVICE"
    fi
    ;;
esac
