require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :request do
  describe 'GET /index' do
    before(:each) do
        get '/public_recipes'
    end
    it 'returns http success' do
      
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
     
      expect(response).to render_template(:index)
    end

    it 'renders correct content' do
     
      expect(response.body).to include('Public recipes')
    end
  end
end