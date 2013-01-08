#!/usr/bin/env python
import wnck
import gtk
import sys
import time

screen = wnck.screen_get_default()

while gtk.events_pending():
    gtk.main_iteration()

windows = screen.get_windows()
        
for w in windows:
     if len(sys.argv) > 1:
         if w.get_application().get_name() == sys.argv[1]:
              w.activate(int(time.time()+1))
              break
     else:
         print("Application name of window with title " + repr(w.get_name()) + " is " + repr(w.get_application().get_name()))
