class Topic < ActiveRecord::Base
  attr_accessible :body, :title, :user_id, :permalink
  validates :title,
  			presence: true,
            length: {minimum: 6, maximum: 25}
  validates :body,
  			presence: true
  
  belongs_to :user
  belongs_to :forum
  has_many :comments

  before_create :create_permalink
  
  def to_param
    permalink
  end
  
  private

	def create_permalink
	  count = Topic.find_by_sql("SELECT COUNT(*) FROM topics WHERE title = '#{self.title}';")
	  count = count[0]['count'].to_i
	  if count > 0
	    permalink = "#{self.title.gsub(/[^a-z0-9]+/i, '-')}-#{count + 1}".downcase
	  else
	  	permalink = "#{self.title.gsub(/[^a-z0-9]+/i, '-')}".downcase
	  end
	  self.permalink = permalink
	end
end
