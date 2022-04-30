require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'recipe_food model' do
    user = User.create(name: 'tom', email: 'tom@tom.com', password: '123456')
    subject { Food.new(user_id: user, name: 'Apple', measurement_unit: 'grams', price: 10) }
    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'measurement unit should be present' do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it 'price should be present' do
      subject.price = nil
      expect(subject).to_not be_valid
    end
  end
end