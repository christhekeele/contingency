module Contingency
  class Configuration

    attr_accessor :errors, :error_messages,
                  :error_layout, :error_template,
                  :unknown_error_message, :failure_message,
                  :logger

    def initialize
      @errors = {}
      @error_messages = {}

      @error_layout = ''
      @error_template = ''

      @unknown_error_message = ['Server Error', 'It looks like something went wrong.']
      @failure_message =  "Server Error: It looks like something went wrong."

      @logger = Logger.new(STDERR)
    end

  end
end
