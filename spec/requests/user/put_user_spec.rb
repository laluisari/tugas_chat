require 'rails_helper'

describe 'PUT /users' do
    # this will create a 'bookmark' method, which return the created bookmark object, 
    # before each scenario is ran
    let!(:user) { FactoryBot.create(:user) }
  
    scenario 'valid user attributes' do
      # send put request to /bookmarks/:id
      put "/users/#{user.id}", params: {
        user: {
            name: user.nama,
            email: user.email
        }
      }
  
      # response should have HTTP Status 200 OK
      expect(response.status).to eq(200)
  
      # response should contain JSON of the updated object
      json = JSON.parse(response.body).deep_symbolize_keys
      expect(json[:nama]).==(user.nama)
      expect(json[:email]).==(user.email)
      
  
      # The bookmark title and url should be updated
      expect(user.reload.nama).==(user.nama)
      expect(user.reload.email).==(user.email)
    end
  end