class MotorcycleSerializer
  include JSONAPI::Serializer
  attributes :id, :brand, :model, :year, :description, :booking_fee, :reserved, :image_url, :user_id, :booking_fee
end
