module JellyfishAudit
  class AuditClient < ActionController::LogSubscriber
    def process_action(event)
      # TODO: SURROUND WITH TRY CATCH MAYBE?

      extract_payload(event)

      log_payload

      prepare_content

      write_to_file if ENV['LOG_TO_FILE'] == 'true'
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
      Rails.logger.info('START RAW ACTION')
      Rails.logger.info('Controller: ' + @controller)
      Rails.logger.info('Method: ' + @method)
      Rails.logger.info('Action: ' + @action)
      Rails.logger.info('Format: ' + @format.to_s)
      Rails.logger.info('Path: ' + @path)
      Rails.logger.info('Params: ' + @params.to_s)
      Rails.logger.info('END RAW ACTION')
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

    def write_to_file
      path = Rails.root.to_s + '/log/audit.txt'
      Rails.logger.info('START LOGGING TO: ' + path)
      File.open(path, 'a') do |f|
        f.puts(@content)
      end
      Rails.logger.info('END LOGGING TO: ' + path)
    end
  end
end
