class Reservation < ApplicationRecord
  belongs_to :equipment
  belongs_to :user

  before_create :calculate_total_price

  validates :start_date, presence: true
  validates :end_date, presence: true

  private

  def calculate_total_price
    self.total_price = (end_date - start_date).to_i * equipment.price_per_day
  end
end
