#!/usr/bin/env ruby
# encoding: utf-8
exceptBranches = ['master', 'pre', 'develop']
for branch in `cd #{ARGV[0]} && git branch -l`.split(' ') - ['*']
    next if exceptBranches.include? branch
    system("git branch -d #{branch}")
end
