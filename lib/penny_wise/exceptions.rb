module PennyWise
  module Exceptions
    class PennyWiseError < Exception
      attr_accessor :message, :backtrace
    end
    class RenderedErrorPageException < PennyWiseError
      def initialize
        @message = 'An error page was explicitly requested.'
        @backtrace = ['None. No real error occured.']
      end
    end
    class ErrorHandlerException < PennyWiseError
      def initialize(original_exception, handler_exception)
        @message =  "`ErrorHandler` encountered exception `#{handler_exception.class.name}`" \
                    " while trying to handle exception `#{original_exception.class.name}`:" \
                    "\n#{handler_exception.message}"
        @backtrace = handler_exception.backtrace
      end
    end
  end
end