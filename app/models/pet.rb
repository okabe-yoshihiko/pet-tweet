class Pet < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
