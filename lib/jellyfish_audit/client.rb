require 'action_controller/log_subscriber'

module JellyfishAudit
  class Client < ActionController::LogSubscriber
    def process_action(event)
      extract_payload(event)
      log_payload
    end

    private

    def extract_payload(event)
      @payload = event.payload
      @controller = @payload[:controller]
      @action = @payload[:action]
      @params = @payload[:params]
      @format = @payload[:format]
      @method = @payload[:method]
      @path = @payload[:path]
    end

    def log_payload
      Rails.logger.info('Controller: ' + @controller)
      Rails.logger.info('Method: ' + @method)
      Rails.logger.info('Action: ' + @action)
      Rails.logger.info('Format: ' + @format.to_s)
      Rails.logger.info('Path: ' + @path)
      Rails.logger.info('Params: ' + @params.to_s)
    end

    def prepare_content
      content = []
      content << 'Controller: ' + @controller
      content << 'Method: ' + @method
      content << 'Action: ' + @action
      content << 'Format: ' + @format.to_s
      content << 'Params: ' + @params.to_s
      @content = content.map { |ln| "#{ln}\n" }.join
    end
  end
end