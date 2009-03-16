class CreatePlaylists < ActiveRecord::Migration
  def self.up
    create_table :playlists do |t|
      t.integer :user_id
      t.string :title
      t.string :info
      t.string :annotation
    end
  end

  def self.down
    drop_table :playlists
  end
end
