require 'rails_helper'

RSpec.describe 'user', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:user) { FactoryBot.create(:user) }

      before do
        post '/users', params:
                          { user: {
                            nama: user.nama,
                            email: user.email,
                            password: user.password,
                            password_confirmation: user.password_confirmation
                          } }
      end

      it 'returns the nama' do
        expect(json['nama']).==(user.nama)
      end

      it 'returns the email' do
        expect(json['email']).==(user.email)
      end

      it 'returns the password' do
        expect(json['password']).==(user.password)
      end

      it 'returns the password confirmation' do
        expect(json['password_confirmation']).==(user.password_confirmation)
      end
      
      it 'returns a created status' do
        expect(response).==(422)
      end
    end

    context 'with invalid parameters' do
      before do
        post '/users', params:
                          { user: {
                            nama: '',
                            email: '',
                            password: '',
                            password_confirmation: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end