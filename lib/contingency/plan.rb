module Contingency

  module Plan

    def self.included(base)
      base.send(:include, Contingency.adapter)
      base.extend ActiveSupport::Rescuable

      if base.catch_errors?
        Contingency.configuration.errors.each do |code, exceptions|
          base.rescue_from *exceptions, with: ->(exception){ render_error code, exception }
        end
      end
    end

    def error
      render_error(params[:code], Contingency::Exceptions::RenderedErrorPageException.new)
    end

    def error_report(exception)
      "#{exception.class} raised on #{request.fullpath}:" \
      "\n#{exception.message}" \
      "\nBacktrace:" \
      "\n#{exception.backtrace.join("\n")}"
    end

    def render_error(code, exception)
      message, description = Contingency.configuration.error_messages.fetch(code, Contingency.configuration.unknown_error_message)
      error_logger = logger.method(code.to_i < 500 ? :info : :error)
      error_logger.call "#{code}: #{description}.\n" + error_report(exception)
      @code = code
      @message = message
      @description = description
      error_renderer(code)
    rescue Exception => handler_exception
      logger.fatal error_report(Contingency::Exceptions::ContingencyPlanException.new(exception, handler_exception))
      failure_renderer(500)
    end
  end

end
