require 'rails_helper'

RSpec.describe 'Testing food views', type: :feature do
  describe 'Food#index' do
    before(:each) do
      user = User.create(name: 'user', email: 'user@user.com', password: '123456')
      (1..4).each { |i| user.foods.create name: "food #{i}", price: 10, measurement_unit: 'grams' }

      visit new_user_session_path
      fill_in 'Email', with: 'user@user.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit user_foods_path(user_id: user.id)
    end

    it 'should display all the food' do
      expect(page).to have_content 'food 1'
      expect(page).to have_content 'food 2'
      expect(page).to have_content 'food 3'
      expect(page).to have_content 'food 4'
    end

    it 'should display delete buttons for each food' do
      within('table') do
        expect(find_all('button').length).to eq 4
      end
    end
  end
end