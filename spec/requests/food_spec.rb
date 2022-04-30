require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET foods#index' do
    before(:each) do
      user = User.create name: 'lilly', email: 'lilly@lilly.com', password: '123456'
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get user_foods_path(user_id: user.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders correct content' do
      expect(response.body).to include('Foods')
    end

    it 'creates food' do
      expect do
        post user_foods_path, params: { food: { name: 'apple', price: 2, unit: 'grams' } }
      end.to change(Food, :count).by(1)
    end

    it 'creates food with correct attributes' do
      post user_foods_path, params: { food: { name: 'banana', price: 3, measurement_unit: 'grams' } }
      expect(Food.last.name).to eq('banana')
      expect(Food.last.price).to eq(3)
      expect(Food.last.measurement_unit).to eq('grams')
    end

    it 'creates food and returns to foods page' do
      post user_foods_path, params: { food: { name: 'banana', price: 3, measurement_unit: 'grams' } }
      expect(response).to redirect_to(user_foods_path)
    end
  end
end