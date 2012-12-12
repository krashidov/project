class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :image
  has_secure_password
  has_many :workouts, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :diets, dependent: :destroy
  mount_uploader :image, ImageUploader
  #has_attached_file :photo
#		    url: "/assets/users/:id/:basename.:extension"
#		    path: ":rails_root/public/assets/users/:id/:basename.:entension"		 	
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token


  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, 
            uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true


  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
end
