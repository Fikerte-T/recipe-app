require 'rails_helper'

RSpec.describe 'Testing recipe views', type: :feature do
  describe 'Recipe#index' do
    before(:each) do
      user = User.create(name: 'user', email: 'user@user.com', password: '123456')
      (1..4).each do |i|
        user.recipes.create(name: "recipe #{i}", preparation_time: '1hr', cooking_time: '1hr', description: 'lorem ipsum',
                            public: true)
      end

      visit new_user_session_path
      fill_in 'Email', with: 'user@user.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit user_recipes_path(user_id: user.id)
    end

    it 'should display all the recipes' do
      expect(page).to have_content 'recipe 1'
      expect(page).to have_content 'recipe 2'
      expect(page).to have_content 'recipe 3'
      expect(page).to have_content 'recipe 4'
    end

    it 'should display delete buttons for each recipe' do
      expect(find_all('button').length) == 4
    end
  end
end
