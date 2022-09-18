class Reservation < ApplicationRecord
  belongs_to :motorcycle
  belongs_to :user

  validates :city, :start_date, :end_date, presence: true, allow_blank: false
end
