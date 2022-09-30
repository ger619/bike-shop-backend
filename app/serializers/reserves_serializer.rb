class ReservesSerializer < ActiveModelSerializers::Model
  include JSONAPI::Serializer
  attributes :id, :brand, :model, :year, :description, :booking_fee, :reserved, :image_url, :user_id, :booking_fee,
             :total_price, :start_date, :end_date, :city, :booking_fee, :motorcycle_id, :reservation_id
end
