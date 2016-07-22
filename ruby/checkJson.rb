#!/usr/bin/ruby
require 'json'

class String
	def red;            "\e[31m#{self}\e[0m" end
	def green;          "\e[32m#{self}\e[0m" end
end

begin
	json = File.read(ARGV[0])
	obj = JSON.parse(json)
	puts "#{ARGV[0]} is Good, congratulations!".green
rescue
	puts "#{ARGV[0]} is Bad, please correct!!!".red
end