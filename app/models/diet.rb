class Diet < ActiveRecord::Base
  attr_accessible :name, :time, :info
  
  belongs_to :user

  validates :user_id, presence: true
  validates :name, presence: true

end
