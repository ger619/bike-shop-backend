class User < ApplicationRecord
  has_secure_password
  has_many :reservations, foreign_key: 'user_id', dependent: :delete_all
  has_many :motorcycles, foreign_key: 'user_id', dependent: :delete_all
end
