class AddIndexesToComments < ActiveRecord::Migration
  def change
  	add_index :comments, :topic_id
    add_index :comments, :user_id
  end
end
