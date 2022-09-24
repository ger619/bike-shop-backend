class Motorcycle < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :reservations, foreign_key: 'motorcycle_id', dependent: :delete_all
end
