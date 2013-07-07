class AddPermalinkToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :permalink, :string
  end
end
