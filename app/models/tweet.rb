class Tweet < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('text LIKE(?)', "%#{search}%")
  end
end
