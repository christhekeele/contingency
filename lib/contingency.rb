require 'active_support/rescuable'
require 'logger'
require "contingency/exceptions"
require "contingency/adapters/interface"

module Contingency

  class << self
    attr_accessor :configuration
    attr_accessor :adapter, :adapters
  end


  def self.configure
    self.adapters = Contingency::Adapters.constants.reject{ |a| a == :Interface }
    unless self.adapter
      if self.adapters.length > 0
        self.adapter = Contingency::Adapters.const_get self.adapters.first
      else
        self.adapter = Adapters::Interface
      end
    end
    self.configuration ||= defined?(self.adapter::Configuration) ? self.adapter::Configuration.new : Configuration.new

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
