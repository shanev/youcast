class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.integer :playlist_id
      t.string :title
      t.string :creator
      t.string :location
      t.string :info
      t.string :image
      t.string :identifier
      t.string :album
    end
  end

  def self.down
    drop_table :tracks
  end
end
