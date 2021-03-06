class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :photo
  has_secure_password
  has_many :workouts, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :diets, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  mount_uploader :photo, ImageUploader


  #We have many followed users through the relationship model
  #and the followed_id of the relationship model as the index
  has_many :followed_users, through: :relationships, source: :followed 

  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy

  has_many :followers, through: :reverse_relationships, source: :follower

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token


  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, 
            uniqueness: { case_sensitive: false }

  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

    def following?(other_user)
      relationships.find_by_followed_id(other_user.id)
    end

    def follow!(other_user)
      relationships.create!(followed_id: other_user.id)
    end

    def unfollow!(other_user)
      relationships.find_by_followed_id(other_user.id).destroy
    end

    def feed
      Post.from_users_followed_by(self)
    end


  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
end
