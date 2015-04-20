module JellyfishAudit
  class AuditClient  < ActionController::LogSubscriber
    def process_action(event)
      payload = event.payload
      Rails.logger.info('START RAW ACTION')

      @controller = payload[:controller]
      @action = payload[:action]
      @params = payload[:params]
      @format = payload[:format]
      @method = payload[:method]
      @path = payload[:path]

      Rails.logger.info('Controller: ' + @controller)
      Rails.logger.info('Method: ' + @method)
      Rails.logger.info('Action: ' + @action)
      Rails.logger.info('Format: ' + @format.to_s)
      Rails.logger.info('Path: ' + @path)
      Rails.logger.info('Params: ' + @params.to_s)
      Rails.logger.info('END RAW ACTION')

    end
  end
end
