#!/bin/bash
sudo startx &
sudo env DISPLAY=:0 XAUTHORITY=/root/.Xauthority chromium-browser --user-data-dir=/home/pi --incognito --kiosk $WEBSITE