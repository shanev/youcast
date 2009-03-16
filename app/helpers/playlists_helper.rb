module PlaylistsHelper
  
  def render_thumbnail(track)
    thumb = File.basename(track.location, File.extname(track.location)).concat("_80x80.jpg")
    image_tag(File.join("/clips", thumb))
  end
end
