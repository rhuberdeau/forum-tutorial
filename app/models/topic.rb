class Topic < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  validates :title,
  			presence: true,
            length: {minimum: 6, maximum: 25}
  validates :body,
  			presence: true
  
  belongs_to :user
  belongs_to :forum
end
