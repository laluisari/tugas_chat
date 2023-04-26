require 'rails_helper'

RSpec.describe 'user', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create_list(:user, 10)
      get '/users'
    end
    
    it 'returns all user' do
      expect(json.size).==(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end