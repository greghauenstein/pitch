class Story < ActiveRecord::Base
  attr_accessible :user_id, :title, :summary, :content
  
  belongs_to :user
  has_many :comments
  has_many :votes
end
