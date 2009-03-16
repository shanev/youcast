class AddPlaylistToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :playlist_id, :integer
  end

  def self.down
    remove_column :users, :playlist_id
  end
end
