require 'rails_helper'

module JellyfishAudit
  RSpec.describe 'Jellyfish Audit Spec', type: :request do
    it 'logs an event on the welcome controller', type: :request do
      get '/'
      expect(Event.last.controller).to eq('Rails::WelcomeController')
      expect(Event.last.method).to eq('GET')
      expect(Event.last.action).to eq('index')
      expect(Event.last.format).to eq('html')
      expect(Event.last.path).to eq('/')
      expect(Event.last.params).to eq('{"controller"=>"rails/welcome", "action"=>"index"}')
    end
  end
end