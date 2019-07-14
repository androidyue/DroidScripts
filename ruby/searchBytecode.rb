#!/usr/bin/ruby
require 'find'
require 'colorize'
require "fileutils"

# extract arguements from command line
dirToSearch = ARGV[0]
keywordToSearch = ARGV[1].to_s.strip
matchedResultFile = ARGV[2]
puts "dirToSearch=#{dirToSearch};keywordToSearch=#{keywordToSearch}, matchedResultFile=#{matchedResultFile}"

# Eagerly create the result file so that user could use tools like `tail -f ` to observer the result 
FileUtils.touch(matchedResultFile)
puts "result will be outputted to #{matchedResultFile}"

# Helper method to append content(each line) to the file
def appendLineContentToFile(lineContent, filePath)
  File.open(filePath, 'a') do |file|
     file.puts "#{lineContent}"
  end
end

# write matched class file path along with bytecode content to the output file.
def writeResultInformation(classFilePath, byteCodeContent, outputFile)
	appendLineContentToFile(classFilePath, outputFile)
	# leave blank lines
	appendLineContentToFile("", outputFile)
	appendLineContentToFile("", outputFile)
	appendLineContentToFile("", outputFile)

	appendLineContentToFile(byteCodeContent, outputFile)

	# leave blank lines
	appendLineContentToFile("", outputFile)
	appendLineContentToFile("", outputFile)
	appendLineContentToFile("", outputFile)
end

 
Find.find(dirToSearch).select {
	|f| f.end_with? ".class" 
}.each {
	|f| 
	puts "checking #{f}"
	byteCodeContent = `javap -p -c #{f}`
	contains = byteCodeContent.include? keywordToSearch 
	resultMessage = ""
	if contains
		resultMessage = "#{f} contains #{keywordToSearch}".green
		writeResultInformation(f, byteCodeContent, matchedResultFile)
	else
		resultMessage = "#{f} does NOT contains #{keywordToSearch}".red
	end
	puts resultMessage
}
