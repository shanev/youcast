class AddFeaturedFlagToClip < ActiveRecord::Migration
  def self.up
    add_column :clips, :featured, :boolean, :default => 0
  end

  def self.down
    remove_column :clips, :featured
  end
end
