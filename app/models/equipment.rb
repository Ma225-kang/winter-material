class Equipment < ApplicationRecord
  include PgSearch::Model
  belongs_to :owner, class_name: "User"
  has_many :reservations
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  pg_search_scope :search_name_and_description,
    against: [:name, :description],
    using: {
      tsearch: { prefix: true }
    }
end
