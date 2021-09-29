require 'rails_helper'

describe Api::V1::PostsController, type: :request do
   
  context 'create post' do
    let (:post_create_url) { '/api/v1/posts' }
    let (:user) { create_user }
    before do
      post post_create_url, params: {
        "post": {
          "title": "Title",
          "body": "Body"
        }
      }.to_json, headers: auth_token
    end

     

    it 'post create successfully'do
      json_resp = JSON.parse(response.body)
      expect(json_resp["title"]).to eq(request.params["post"]["title"]) 
      expect(json_resp["body"]).to eq(request.params["post"]["body"])
    end

   end
end	