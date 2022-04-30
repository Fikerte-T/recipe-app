require 'rails_helper'

RSpec.describe 'Testing public recipe views', type: :feature do
  describe 'PublicRecipe#index' do
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
      visit public_recipes_path
    end

    it 'should display all the public recipes' do
      expect(page).to have_content 'recipe 1'
      expect(page).to have_content 'recipe 2'
      expect(page).to have_content 'recipe 3'
      expect(page).to have_content 'recipe 4'
   
    end

    it 'should display all the food item counts' do
      expect(page).to have_content 'Total food items: 0'
    end

  end
end