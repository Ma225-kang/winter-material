class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations # => Mes reservations
  has_many :equipment, foreign_key: :owner_id # => Mes equipements

  has_many :owner_reservations, through: :equipment, source: :reservations # => Les resa faites sur mes equipements
end

# current_user.reservations
# current_user.owner_reservations
# current_user.equipment
# equipment.owner
# reservation.user
# reservation.equipment
