require 'rails_helper'

RSpec.describe "Snippets API", type: :request do
  let(:user) { User.create(password: '1', password_confirmation: '1') }
  let(:snippet) { Snippet.create(name: 'new snippet') }

  describe "GET /api/snippets/:id" do
    
    it "should prevent unauthorized users" do
      get "/api/snippets/#{snippet.id}"
      expect(response).to have_http_status(401)
    end
    
    it "should return the snippet if authorized" do
      get "/api/snippets/#{snippet.id}?api_key=#{user.api_key}"
      expect(response).to have_http_status(200)

      json = JSON.parse(response.body)
      expect(json['name']).to eq('new snippet')
    end
  end

  describe "PUT /api/snippets/:id" do
    it "should return the snippet if authorized" do
      put "/api/snippets/#{snippet.id}?api_key=#{user.api_key}&snippet[name]=snippet2"
      expect(response).to have_http_status(200)

      json = JSON.parse(response.body)
      expect(json['name']).to eq('snippet2')
      expect(snippet.reload.name).to eq('snippet2')
    end
  end
end
