#!/bin/sh 
adb shell am start  -a "android.settings.APPLICATION_DETAILS_SETTINGS" -d "package:$1"
