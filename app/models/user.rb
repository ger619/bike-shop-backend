class User < ApplicationRecord
  has_many :reservations
  has_many :motorcycles

  validates :name, presence: true
end
