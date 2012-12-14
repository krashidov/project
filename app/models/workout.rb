class Workout < ActiveRecord::Base
  attr_accessible :content, :name, :time, :workout_type
  belongs_to :user
  
  validates :content, presence: true
  validates :name, presence: true
  validates :time, presence: true
  validates :workout_type, presence: true
  validates :user_id, presence: true
end
