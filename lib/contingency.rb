require 'active_support/concern'
require 'active_support/rescuable'
require 'logger'
require "contingency/exceptions"
require "contingency/adapters/interface"

module Contingency

  class << self
    alias :configure :initialize
    attr_accessor :configuration
    attr_accessor :adapter, :adapters
  end

  self.adapters = []

  def self.configure
    self.adapter ||= self.adapters.first || Adapters::Interface
    self.configuration ||= Configuration.new

    yield(self.adapter.default_configuration) if self.adapter.respond_to?(:default_configuration)
    yield(configuration) if block_given?

    require "contingency/plan"

    configuration
  end

  def self.logger
    @logger ||= configuration.logger
  end


end

require "contingency/configuration"
require "contingency/version"
