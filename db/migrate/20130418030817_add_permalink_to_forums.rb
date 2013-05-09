class AddPermalinkToForums < ActiveRecord::Migration
  def self.up
    add_column :forums, :permalink, :string
    add_index :forums, :permalink, :unique => true
  end
end
