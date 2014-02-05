class Story < ActiveRecord::Base
  attr_accessible :title, :summary, :content
  
  belongs_to :user
  has_many :comments
end
