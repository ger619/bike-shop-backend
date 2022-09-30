class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: :user_id
  belongs_to :motorcycle, class_name: 'Motorcycle', foreign_key: :motorcycle_id

  def left_join_motorcycle
    Motorcycle.left_outer_joins(:reservations)
      .select('reservations.*, motorcycles.*, reservations.id as reservation_id, reservations.user_id as r_user_id')
  end

  def left_joins_user(id)
    Motorcycle.left_outer_joins(:reservations)
      .select('reservations.*, motorcycles.*, reservations.id as reservation_id, reservations.user_id as r_user_id')
      .where("reservations.user_id = #{id}")
  end
end
