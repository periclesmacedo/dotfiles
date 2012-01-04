# Autocomplete
require "irb/completion"

# Add all gems installed in the system to the $LOAD_PATH so they can be used in Rails console with Bundler
if defined?(::Bundler)
  current_ruby_version = `rbenv version`.split(" ").first
  gem_paths = Dir.glob("#{ENV["HOME"]}/.rbenv/versions/#{current_ruby_version}/lib/ruby/gems/**/gems/*/lib")
  gem_paths.each do |path|
    $LOAD_PATH << path
  end
end

IRB.conf[:AUTO_INDENT] = true

# Use Pry everywhere
require "rubygems"
require 'pry'
Pry.start
exit
