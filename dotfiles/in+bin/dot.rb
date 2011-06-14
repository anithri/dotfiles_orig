#!/usr/bin/env ruby
require 'pathname'
DF = Pathname('.dotty/default/dotfiles/dotfiles')

def error_out(msg)
  puts msg
  exit -1
end

def skip(msg)
  puts "  Skipping: #{msg}"
end 

def check_file(my_file)
  return my_file if my_file.file? && my_file.size?
  unless my_file.file?
    skip "#{my_file} doesn't exist." return nil
  end
  
  unless my_file.size?
    skip "#{my_file} is empty." 
    return nil
  end
end

def target(my_file)

end

def all
  @all ||= []
end

def normalize(file)
  Pathname(ENV['HOME']) + file
end

def do_checks(file)

  all << check_file(normalize(file))
end

def usage
  puts "cam file1 [file2 file3 ...]"
  exit
end

usage if ARGV.empty?

unless Dir.pwd == ENV['HOME']
  puts "files must be given in relation to #{ENV['HOME']}"
end


ARGV.each { |f| do_checks(Pathname(f)) }

all.compact.each do |file|
  puts "processing #{file}"
  destination = DF + file.relative_path_from(ENV['HOME'])
  
end
