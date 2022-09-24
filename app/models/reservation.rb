class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :motorcycle, class_name: 'Motorcycle', foreign_key: :motorcycle_id
end
