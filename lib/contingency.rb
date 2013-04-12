require 'active_support/inflector'
require 'active_support/concern'
require 'active_support/rescuable'
require 'active_support/core_ext/object/try'
require 'logger'
require "contingency/exceptions"


module Contingency

  class << self
    alias :configure :initialize
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
    require "contingency/integration"
    require "contingency/plan"
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

require "contingency/configuration"
require "contingency/integrations/rails/railtie.rb" if defined?(Rails)
require "contingency/version"
