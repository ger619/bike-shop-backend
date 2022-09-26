require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create!(username: 'Hammed', password_digest: 'abc@123')
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      @user.save
      expect(@user).to be_valid
    end

    it 'is not valid without a secured password' do
      @user.password_digest = nil
      @user.save
      expect(@user).to_not be_valid
    end
  end

  context 'associations' do
    it 'has many motorcycles' do
      assc = described_class.reflect_on_association(:motorcycles)
      expect(assc.macro).to eq :has_many
    end

    it 'has many reservations' do
      assc = described_class.reflect_on_association(:reservations)
      expect(assc.macro).to eq :has_many
    end
  end
end
