class Motorcycle < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  has_many :reservations, foreign_key: 'motorcycle_id', dependent: :delete_all
  has_one_attached :image
  def image_url
    Rails.application.routes.url_helpers.url_for(image) if image.attached?
  end
end
