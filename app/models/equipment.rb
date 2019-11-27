class Equipment < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :reservations
  mount_uploader :photo, PhotoUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
