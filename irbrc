require 'rubygems'
require 'yaml'
require 'ap' # Awesome printing
require 'irb/completion' # Enable tab-completion
require 'wirble'
require 'hirb'
require 'interactive_editor'

# Add all gems in the global RVM gemset to the $LOAD_PATH so they can
# be used in the rails console
if defined?(::Bundler)
  global_gemset = ENV['GEM_PATH'].split(':').grep(/ruby.*@global/).first
  if global_gemset
    all_global_gem_paths = Dir.glob("#{global_gemset}/gems/*")
    all_global_gem_paths.each do |p|
      gem_path = "#{p}/lib"
      $LOAD_PATH << gem_path
    end
  end
end

# load Wirble
Wirble.init()
Wirble.colorize

# load Hirb
#Hirb::View.enable
#Hirb.add_dynamic_view("ActiveRecord::Base", :helper=>:auto_table) {|obj| {:fields=>obj.class.column_names} }

# Automatically indent code when entering it
#IRB.conf[:AUTO_INDENT] = true

# local_methods shows methods that are only available for a given object
class Object
  def local_methods
    self.methods.sort - self.class.superclass.methods
  end
end

# If we're in Rails (script/console)
if ENV.include?('RAILS_ENV')
  
  # Outputs log message straight to the console
  if !Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    Object.const_set('RAILS_DEFAULT_LOGGER', Logger.new(STDOUT))
  end

  # Adds a sql method to perform queries easily from irb
  def sql(query)
    ActiveRecord::Base.connection.select_all(query)
  end
  
  if ENV['RAILS_ENV'] == 'test'
    require 'test/test_helper'
    require 'spec/spec_helper'
  end

# for rails 3
elsif defined?(Rails) && !Rails.env.nil?
  if Rails.logger
    Rails.logger =Logger.new(STDOUT)
    ActiveRecord::Base.logger = Rails.logger
  end
  if Rails.env == 'test'
    require 'test/test_helper'
  end
else
  # nothing to do
end