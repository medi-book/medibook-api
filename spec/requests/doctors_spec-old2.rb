require 'rails_helper'

RSpec.describe '/doctors', type: :request do
  let!(:user) { User.create(username: 'soulchild', password_digest: 'abcdef', role: 'regular') }
  
  describe 'GET /index' do
    it 'renders a successful response' do
      get '/doctors'
           
      
      # expect(subject).to  be_successful
      expect(response).to  have_http_status(200)
      expect(response).to  have_http_status(:success)
      expect(response.status).to eq(200)
    end
  end    
end