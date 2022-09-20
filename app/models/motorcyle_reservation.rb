class MotorcyleReservation < ApplicationRecord
  belongs_to :motorcyle_id
  belongs_to :reservation_id
end
