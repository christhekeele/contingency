module Contingency
  class Configuration

    attr_accessor :require_integration, :errors, :error_messages, :error_layout,
                  :error_template, :failure_message, :unknown_error_message, :logger

    def initialize
      @require_integration = true
      @errors = {}
      @error_messages = {}
      @unknown_error_message = ['Unexpected Error', 'It looks like something went wrong.']
      @error_layout = 'application'
      @error_template = '/errors/error'
      @failure_message =  "While handling an error, our error handler encountered an error;" \
                          " which is why we built this second one." \
                          "\nThis issue has been registered as critical." \
                          "\nYou can imagine fixing it is now our top priority," \
                          " thank you for discovering it!"
      @logger = Logger.new(STDERR)
    end

  end
end
