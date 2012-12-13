class Attachment < ActiveRecord::Base
  belongs_to :attachable
  attr_accessible :description, :file
end
