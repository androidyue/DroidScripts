#!/usr/bin/env ruby
# encoding: utf-8
#Usage: ruby removeOldFiles.rb dest_dir day_before [pattern]
destDir= ARGV[0]
daysBefore= ARGV[1]
pattern = (ARGV.size == 3) ? ARGV[2]: '*'
edenTime = Time.now.to_i - daysBefore.to_i * 86400
Dir[destDir + '/' + pattern ].each{|child|
    system "rm -rfv #{child}"   if (File.mtime(child).to_i < edenTime)
}
