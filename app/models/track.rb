class Track < ActiveRecord::Base
  belongs_to :playlist
  has_one :clip
  
  validates_presence_of :title, :location
  # TODO: validate uniqueness of track id in playlist scope so dup tracks can't be created
  # validates_uniqueness_of :id, :scope => :playlist ??
  
  # this is needed because the column named 'type' is reserved in Rails
  # so we make it called 'none' because single table inheritance is not being used
  # a column named 'type' is needed because it is part of the XSPF standard
  def self.inheritance_column
    "none"
  end
  
  alias_method :base_to_xml, :to_xml
  def to_xml(options={})
    base_to_xml(options.merge(:except => [ :id, :playlist_id ]))
  end  
  
end
