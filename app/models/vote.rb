class Vote < ActiveRecord::Base
  attr_accessible :user_id, :story_id, :up
  
  validates :user_id, :uniqueness => { :scope => :story_id }
  
  belongs_to  :story
  belongs_to  :user
end
