# vim FTW
Pry.config.editor = "mvim --nofork"

# My pry is polite
Pry.hooks = { :after_session => proc { puts "bye-bye" } }

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

#%w{map_by_method hirb}.each { |gem| require gem }

# Toys methods
# Stealed from https://gist.github.com/807492
class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

require "pp"

begin
  require "hirb"
rescue LoadError
  puts "Failed to initialize Hirb"
end

begin
#  require "wirble"
#  Wirble.init
#  Wirble.colorize
rescue LoadError
  puts "Failed to initialize Wirble"
end

begin
  require "ap"
rescue LoadError
  puts "Failed to initialize awesome_print"
end

begin
  require "looksee"
rescue LoadError
  puts "Failed to initialize Looksee"
end


#IRB.conf[:AUTO_INDENT] = true

# loading rails configuration if it is running as a rails console
load File.dirname(__FILE__) + '/.railsrc' if defined?(Rails) && Rails.env
