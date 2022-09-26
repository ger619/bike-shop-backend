require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @user = User.create!(username: 'Hammed', password_digest: 'abc@123')
    @motorcycle = Motorcycle.new(user_id: @user.id, brand: 'Honda', model: 'CBR1000RR', year: '2021', 
      image: 'https://www.honda.com.au/content/dam/honda/australia/motorcycles/cbr1000rr/2021/overview/overview-1.jpg', 
      description: 'Latest Model', booking_fee: 100
    )
    @reservation = Reservation.new(user_id: @user.id, total_price: 230, start_date: 10/10/2022, end_date: 13/10/2022, city: 'Lagos')
  end

  it 'City should not be empty or nil' do
    subject.city = nil
    expect(subject).to_not be_valid
  end

  it 'Start Date should not be empty or nil' do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end

  it 'End Date should not be empty or nil' do
    subject.end_date = nil
    expect(subject).to_not be_valid
  end

  describe 'associations' do
    it 'belongs to users' do
        assc = described_class.reflect_on_association(:user)
        expect(assc.macro).to eq :belongs_to
    end

    it 'belongs to motorcycle' do
      assc = described_class.reflect_on_association(:motorcycle)
      expect(assc.macro).to eq :belongs_to
    end
  end
end
