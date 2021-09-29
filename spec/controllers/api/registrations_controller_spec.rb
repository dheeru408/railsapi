require 'rails_helper'

describe RegistrationsController, type: :request do

  let (:user) { create_user }
  let (:existing_user) { existing_user }
  let (:signup_url) { '/api/signup' }

  context 'When creating a new user' do
    before do
      debugger
      post signup_url, params: {
        user: {
          email: Faker::Internet.email,
          password: user.password
        }
      }
    end

    it 'returns 200' do
      expect(response.status).to eq(200)
    end

    it 'returns a token' do
      debugger
      expect(response.headers['Authorization']).to be_present
    end

    it 'returns the user email' do
      expect(json["email"]).to eq(request.params["user"]["email"])
    end
  end

  context 'When an email already exists' do
    before do
      post signup_url, params: {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    it 'returns 400' do
      parsed_resp = JSON.parse(response.body)
      expect(parsed_resp["status"]).to eq(400)
      expect(response.status).to eq(400)
    end
  end

end