#!/bin/sh 
#Explanations:
# System.err to grep stacktrace information of catched exceptions
#AndroidRuntime to grep stacktrace information of uncaughted runtime exceptions
#MessageQueue to grep exceptions happended during MessageQueue
#CONSOLE to grep console message releated with javascript console.info
#dalvikvm informations about dalvik vm 
#StrictMode information about StrictMode warnings
adb logcat |grep --color=always -E "System.err|AndroidRuntime|MessageQueue|CONSOLE|W/Bundle|dalvikvm|StrictMode"
