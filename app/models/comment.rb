class Comment < ActiveRecord::Base
  attr_accessible :content, :topic_id, :user_id

  validates :content,
            presence: true

  belongs_to :user
  belongs_to :topic
end
