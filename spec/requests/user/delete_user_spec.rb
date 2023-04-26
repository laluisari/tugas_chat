require 'rails_helper'

RSpec.describe 'user', type: :request do
  describe "DELETE /destroy" do
    let!(:user) { FactoryBot.create(:user) }

    before do
      delete "/users/#{user.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(200)
    end
  end
end