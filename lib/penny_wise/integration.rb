Dir.glob( "#{PennyWise.root}/lib/penny_wise/integrations/*.rb", &method(:require) )
module PennyWise

  class << self
    attr_accessor :integrations
  end
  PennyWise.integrations = %w[::Rails ::Padrino]

  class IntegrationNotFoundException < PennyWise::Exceptions::PennyWiseError
    @message = "PennyWise could not find a framework to automatically integrate with." \
               "\nTried: #{PennyWise.integrations.join(', ')}"
  end

  module Integration
    found = nil
    PennyWise.integrations.each do |integration|
      begin
        if defined?(PennyWise.const_get integration)
          include "PennyWise::Integration#{integration}".constantize
          found = integration
          break
        end
      rescue NameError
      end
    end
    unless found
      if PennyWise.configuration.require_integration
        raise PennyWise::IntegrationNotFoundException
      else
        PennyWise.logger.warn "PennyWise did not find a framework to automatically integrate with." \
                              "\nTried: #{PennyWise.integrations.join(', ')}." \
                              "\nRefer to the README to learn how to use PennyWise without integration." \
      end
    end
  end
end
