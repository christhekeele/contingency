module PennyWise

  def self.render_errors?
    !Rails.application.config.action_dispatch.show_exceptions or !Rails.application.config.consider_all_requests_local
  end

  module Integration
    module Rails

      def error_renderer(code)
        return render PennyWise.configuration.error_template,
                      status: code,
                      layout: PennyWise.configuration.error_layout
      end

      def failure_renderer(code)
        render status: code, text: PennyWise.configuration.failure_message
      end


      def routing_error
        # Raise traditional Rack-level Rails RoutingError at Application-level instead,
        # so it `rescue_from` in PennyWise's error handler can catch it instead of Rack's.
        # Works in conjunction with a catchall route pointed at this method.
        raise ActionController::RoutingError, "No route matches [#{env['REQUEST_METHOD']}] #{env['PATH_INFO'].inspect}"
      end
    end
  end
end
