class Playlist < ActiveRecord::Base
  has_many :tracks
  belongs_to :user
    
  alias_method :base_to_xml, :to_xml
  
  def to_xml(options={})
    options.merge!(:skip_instruct => true, :include => :tracks, :except => [ :id, :user_id ])

    substitutions = {
      /tracks/ => "trackList",
      /<playlist>/ => "<playlist version=\"1\" xmlns=\"http://xspf.org/ns/0/\">"
    }
    
    returning base_to_xml(options) do |xml|
      substitutions.each do |k, v|
        xml.gsub!(k, v)
      end
    end
  end  
end
