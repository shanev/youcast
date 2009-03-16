class CreateClips < ActiveRecord::Migration
  def self.up
    create_table :clips do |t|
      t.string :title
      t.string :location
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :clips
  end
end
