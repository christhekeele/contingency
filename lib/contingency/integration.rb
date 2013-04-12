Dir.glob( "#{Contingency.root}/lib/contingency/integrations/*.rb", &method(:require) )
module Contingency

  class << self
    attr_accessor :integrations
  end
  Contingency.integrations = %w[::Rails ::Padrino]

  class IntegrationNotFoundException < Contingency::Exceptions::ContingencyError
    @message = "Contingency could not find a framework to automatically integrate with." \
               "\nTried: #{Contingency.integrations.join(', ')}"
  end

  module Integration
    found = nil
    Contingency.integrations.each do |integration|
      begin
        if defined?(Contingency.const_get integration)
          include "Contingency::Integration#{integration}".constantize
          found = integration
          break
        end
      rescue NameError
      end
    end
    unless found
      if Contingency.configuration.require_integration
        raise Contingency::IntegrationNotFoundException
      else
        Contingency.logger.warn "Contingency did not find a framework to automatically integrate with." \
                              "\nTried: #{Contingency.integrations.join(', ')}." \
                              "\nRefer to the README to learn how to use Contingency without integration." \
      end
    end
  end
end
