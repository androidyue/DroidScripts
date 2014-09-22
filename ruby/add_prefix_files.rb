#!/usr/bin/env ruby
# encoding: utf-8

srcDir= ARGV[0]
prefix= ARGV[1]
pattern = '*'
pattern = ARGV[2] if ARGV.size == 3

Dir[srcDir + '/' + pattern ].each{|child| 
    childName = File.basename(child)
    destChildName = prefix  + childName 
    destChild = child.gsub(childName, destChildName)
    system 'mv %s %s'%[child, destChild]
}
