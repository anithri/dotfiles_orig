# load libraries
require 'rubygems' unless defined? Gem
require 'irbtools'

# method the return the methods not present on basic objects, good for
# investigations
class Object
    def interesting_methods
        (self.methods - Object.instance_methods).sort
    end
end

# toys methods to play with.
# Stealed from https://gist.github.com/807492
class Array
    def self.toy(n=10,&block)
        block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
    end
end   

class Hash
    def self.toy(n=10)
        Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
    end
end

# detects a rails console, cares about version
def rails?(*args)
    version=args.first
    v2 = ($0 == 'irb' && ENV['RAILS_ENV']) 
    v3 = ($0 == 'script/rails' && Rails.env) 
    version == 2 ? v2 : version == 3 ? v3 : v2 || v3
end

# loading rails configuration if it is running as a rails console
load File.dirname(__FILE__) + '/.railsrc' if rails?

# my irb is polite
IRB.conf[:AT_EXIT] << Proc.new {puts "bye-bye"}

def dev
  $LOAD_PATH.unshift(Dir.pwd + '/lib') unless $LOAD_PATH.include?(Dir.pwd + '/lib')
end

Hirb.enable output: { "Project" => {options: {fields: %w{id name state}}},
                      "User" => {options: {fields: %w{id login}}}
}
