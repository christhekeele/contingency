module Contingency
  module Integration
    module Rails
      class Railtie < ::Rails::Railtie
        initializer "contingency.error_handler" do
          # Not defined at initializer runtime
          # ApplicationController.send(:include, Contingency::ErrorHandler) if defined?(ApplicationController)
        end
      end
    end
  end
end
