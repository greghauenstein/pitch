class Comment < ActiveRecord::Base
  attr_accessible :message, :user_id, :link_id
  #has_many  :users
    belongs_to  :story
    belongs_to  :user
end