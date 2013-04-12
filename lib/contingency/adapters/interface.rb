module Contingency

  module Adapters
    module Interface

      class InterfaceNotImplementedError < NotImplementedError; end

      module ClassMethods
        def catch_errors?
          raise InterfaceNotImplementedError,
            "Override this `catch_errors?` method" \
            " with one that decides if your framework should activate" \
            " Contingency or not (ie `ENV[RACK_ENV] !== 'development'`)."
        end
      end

      def self.included(base)
        base.extend(ClassMethods)
      end

      def error_renderer(code)
        raise InterfaceNotImplementedError,
          "Override this `error_renderer` method" \
          " with one that expects an error code," \
          " and uses your framework's render syntax" \
          " to render Contingency.configuration.error_template."
      end

      def failure_renderer(code)
        raise InterfaceNotImplementedError,
          "Override this `failure_renderer` method" \
          " with one that expects an error code," \
          " and uses your framework's render syntax"
          " to display `Contingency.configuration.failure_message`."

      end

    end
  end
end
