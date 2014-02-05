class Story < ActiveRecord::Base
  attr_accessible :title, :summary, :content
  
  belongs_to :user
end
