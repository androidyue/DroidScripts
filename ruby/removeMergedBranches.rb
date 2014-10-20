#!/usr/bin/env ruby
# encoding: utf-8
for branch in `cd #{ARGV[0]} && git branch -l`.split(' ')
    next if branch == '*'
    system("git branch -d #{branch}")
end
