#!/bin/bash 
adb logcat | grep -v InputReader | grep AppLaunch
