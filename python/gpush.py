#!/usr/bin/env python
# coding=utf-8
from subprocess import Popen,PIPE,STDOUT
from os import system

def gpush():
    branchColorRule = readFromShell('git config color.branch')
    if ('always' == branchColorRule):
        system('git config color.branch auto')

    getBranch = "git branch | sed -n '/\* /s///p'"
    gitBranch = readFromShell(getBranch)
    command = 'git push origin %s'%(gitBranch)
    print command
    system(command)
    if ('always' == branchColorRule):
        system('git config color.branch always')


def readFromShell(command):
    p = Popen(command, shell=True, stdin=PIPE, stdout=PIPE, stderr=STDOUT, close_fds=True)
    result = p.stdout.read().strip()
    return result

gpush()
