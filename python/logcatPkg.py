#!/usr/bin/env python
#coding:utf-8
#This script is aimed to grep logs by application(User should input a packageName and then we look up for the process ids then separate logs by process ids).

import os
import sys

packageName=str(sys.argv[1])

def getDeviceId():
    devices = []
    command = "adb devices -l | sed '1d'| awk '{print $1}'"
    result = os.popen(command)
    deviceId = result.readline().strip()
    if deviceId != "":
        devices.append(deviceId)

    while (deviceId != ""):
        deviceId = result.readline().strip()
        if deviceId != "":
            devices.append(deviceId)
    return devices;

def printPakcageLog(device, packageName):
    # print device, packageName
    print "Got device: " + device
    command = "adb -s %s shell ps | grep %s | awk '{print $2}'"%(device, packageName)
    # print command
    p = os.popen(command)
    ##for some applications,there are multiple processes,so we should get all the process id
    pid = p.readline().strip()
    filters = pid
    while(pid != ""):
        pid = p.readline().strip()
        if (pid != ''):
            filters = filters +  "|" + pid
            #print 'command = %s;filters=%s'%(command, filters)
    if (filters != '') :
        cmd = 'adb -s %s logcat -v time | grep --color=always -E "%s" '%(device, filters)
        os.system(cmd)

devices = getDeviceId();
devicesNum = len(devices);

if devicesNum < 1:
    print "Device not found."
elif devicesNum == 1:
    device = devices[0]
    printPakcageLog(device, packageName)
else:
    print "Please chose a dvice, input the index of the device:"
    for i in xrange(0, devicesNum):
        print str(i) + "\t" + devices[i]
    index = raw_input("")
    printPakcageLog(devices[int(index)], packageName)
