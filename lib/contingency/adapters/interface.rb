module Contingency

  module Adapters
    module Interface

      extend ActiveSupport::Concern

      included do
        class InterfaceNotImplementedError < NotImplementedError; end
      end

      ###
      # Required integration methods go here.
      #  They're implemented here as no-ops that raise an error so
      #  all subclasses have to define them.
      #

      module ClassMethods
        def catch_errors?
          raise InterfaceNotImplementedError, "Override this `catch_errors?` method" \
                                              " with one that decides if your framework should activate" \
                                              " Contingency or not (ie `ENV[RACK_ENV] !== 'development'`)."
        end
      end

      module InstanceMethods
        def error_renderer(code)
          raise InterfaceNotImplementedError, "Override this `error_renderer` method" \
                                              " with one that expects an error code, and uses your framework's" \
                                              " render method to find your views for it." \
                                              " (ie `render Contingency.configuration.error_template, status: code`," \
                                              " or even just `render code`)"
        end

        def failure_renderer(code)
          raise InterfaceNotImplementedError, "Override this `failure_renderer` method" \
                                              " with one that expects an error code, and uses your framework's" \
                                              " render method to display a simple text error page in the event" \
                                              " your `#{self.class.name}#error_renderer?`'s render can't render" \
                                              " your error template." \
                                              " (ie `render status: code, text: Contingency.configuration.error_template`)"

        end
      end

    end
  end
end
