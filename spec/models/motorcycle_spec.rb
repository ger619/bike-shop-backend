require 'rails_helper'

RSpec.describe Motorcycle, type: :model do
  before(:each) do
    @user = User.create!(username: 'Hammed', password_digest: 'abc@123')
    @motorcycle = Motorcycle.new(user_id: @user.id, brand: "Honda", model: "CBR1000RR", year: "2021", image: "https://www.honda.com.au/content/dam/honda/australia/motorcycles/cbr1000rr/2021/overview/overview-1.jpg", description: "Latest Model", booking_fee: 100)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      @motorcycle.save
      expect(@motorcycle).to be_valid
    end

    it 'is not valid without a name' do
      expect(Motorcycle.new).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many reservations' do
      assc = described_class.reflect_on_association(:reservations)
      expect(assc.macro).to eq :has_many
    end

    it 'belongs to users' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
