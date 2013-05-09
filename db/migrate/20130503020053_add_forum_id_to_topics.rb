class AddForumIdToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :forum_id, :integer
  end
end
