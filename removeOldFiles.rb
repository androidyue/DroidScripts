#!/usr/bin/env ruby
# encoding: utf-8
srcDir= ARGV[0]
expireDays = ARGV[1]
pattern = '*'
pattern = ARGV[2] if ARGV.size == 3 
edenTime = Time.now.to_i - expireDays.to_i * 86400
Dir[srcDir + '/' + pattern ].each{|child|
    lastModifiedTime = File.mtime(child).to_i
    system "rm -rfv #{child}"   if (lastModifiedTime < edenTime)
}
