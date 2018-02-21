################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-present Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

import subprocess
import xbmc
import xbmcaddon


class Monitor(xbmc.Monitor):

   def __init__(self, *args, **kwargs):
      xbmc.Monitor.__init__(self)
      self.id = xbmcaddon.Addon().getAddonInfo('id')

   def onSettingsChanged(self):
      subprocess.call(['systemctl', 'restart', self.id])


if __name__ == '__main__':
   Monitor().waitForAbort()
