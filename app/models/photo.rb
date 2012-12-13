class Photo < ActiveRecord::Base
  attr_accessible :image, :name
  belongs_to :user
  mount_uploader :image, ImageUploader

  validates :image, presence: true
  validates :name, presence: true
  validates :user_id, presence: true

end
