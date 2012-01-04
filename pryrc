# vim FTW
Pry.config.editor = "mvim --nofork"

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

require "pp"

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

begin
  require "hirb"
rescue LoadError
  puts "Failed to initialize Hirb"
end

# loading rails configuration if it is running as a rails console
load File.dirname(__FILE__) + '/.railsrc' if defined?(Rails) && Rails.env
