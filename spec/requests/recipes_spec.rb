require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  describe 'GET recipes#index' do
    before(:each) do
      user = User.create(name: 'fikerte', email: 'fiker@fiker.com', password: '123456')
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
      expect(response.body).to include('Add Food')
    end
  end

  describe 'GET /show' do
    before(:each) do
      user = User.create(name: 'fikerte', email: 'fiker@fiker.com', password: '123456')
      recipe = Recipe.create(name: 'my recipe', cooking_time: '1hr', preparation_time: '1hr', description: 'test description',
                             public: true, user_id: user.id)
      post user_session_path, params: { user: { email: user.email, password: user.password } }
      get recipe_path(recipe.id)
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders correct template' do
      expect(response).to render_template(:show)
    end

    it 'renders correct content' do
      expect(response.body).to include('Cooking time: 1hr')
      expect(response.body).to include('test description')
    end
  end
end
