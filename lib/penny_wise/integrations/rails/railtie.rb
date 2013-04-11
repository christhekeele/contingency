module PennyWise
  module Integration
    module Rails
      class Railtie < ::Rails::Railtie
        initializer "penny_wise.error_handler" do
          # Not defined at initializer runtime
          # ApplicationController.send(:include, PennyWise::ErrorHandler) if defined?(ApplicationController)
        end
      end
    end
  end
end
