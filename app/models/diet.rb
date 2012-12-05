class Diet < ActiveRecord::Base
  attr_accessible :info, :name, :time
  
  belongs_to :user

  validates :user_id, presence: true
  validates :info, presence: true
  validates :name, presence: true
  validates :time, presence: true
end
