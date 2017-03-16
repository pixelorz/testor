#!/bin/bash
# Run VNC server with tail in the foreground
vncserver :1 -geometry 1366x768 -depth 24 && tail -F ~/.vnc/*.log
