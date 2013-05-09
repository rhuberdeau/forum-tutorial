class Forum < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, :presence => true,
                   :length => {:minimum => 10}
  validates :description, :presence => true,
            :length => {:maximum => 250}
  
  has_many :topics
  before_create :create_permalink

  def to_param
    permalink
  end
	
	private

	def create_permalink
	  permalink = self.name.gsub(' ', '-').gsub(/[^a-zA-Z0-9\_\-\.]/, '')
	  self.permalink = permalink
	end
end
