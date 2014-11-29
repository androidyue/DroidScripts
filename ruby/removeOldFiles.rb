#!/usr/bin/env ruby
# encoding: utf-8
#Usage: ruby removeOldFiles.rb "dest_file_pattern" days_before
destFilePattern= ARGV[0]
daysBefore= ARGV[1]
edenTime = Time.now.to_i - daysBefore.to_i * 86400
Dir[destFilePattern].each{|child|
    system "rm -rfv #{child}"   if (File.mtime(child).to_i < edenTime)
}
