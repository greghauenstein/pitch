class Comment < ActiveRecord::Base
  attr_accessible :message, :user_id, :story_id

  belongs_to  :story
  belongs_to  :user
end