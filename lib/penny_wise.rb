require 'active_support/inflector'
require 'active_support/concern'
require 'active_support/rescuable'
require 'active_support/core_ext/object/try'
require 'logger'
require "penny_wise/exceptions"


module PennyWise

  class << self
    alias :configure :initialize
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
    require "penny_wise/integration"
    require "penny_wise/error_handler"
    configuration
  end

  def self.root
    Pathname.new(File.expand_path("../..", __FILE__))
  end

  # To be overriden by integrations
  def self.render_errors?
    true
  end

  def self.logger
    @logger ||= configuration.logger
  end

end

require "penny_wise/configuration"
require "penny_wise/integrations/rails/railtie.rb" if defined?(Rails)
require "penny_wise/version"
