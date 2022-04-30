require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'should test model validations' do
    subject { User.new(name: 'tim', email: 'tim@tim.com', password: '123456') }

    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to be_valid
    end
    it 'email should be present' do
        subject.email = nil
        expect(subject).to_not be_valid
      end
  end
end
