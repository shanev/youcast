require 'transcode'
require 'fileutils'

class Clip < ActiveRecord::Base
  include FileUtils
  
  belongs_to :user
  validates_presence_of :title, :location, :user_id
  
  after_destroy do |clip|
    Playlist.find(:all).each do |playlist| 
      playlist.tracks.delete_if { |track| track.title == clip.title }
    end
  end
  
  def uploaded_data=(file)
    begin
      logger.info("original filename1: #{file.original_filename}")
      
      tmp_file = File.join(RAILS_ROOT, "tmp", file.original_filename)
      File.open(tmp_file, File::CREAT|File::TRUNC|File::WRONLY,0666){ |f| f.write(file.read) }

      clips_dir = File.join(RAILS_ROOT, "public", "system")
    
      case File.extname(tmp_file).sub!(/./, "").to_sym
      when :mp3, :jpg, :png, :gif, :swf
        cp tmp_file, clips_dir
        logger.info("original filename2: #{file.original_filename}")
        
        self.location = File.join(CLIPS_URL, file.original_filename)
      else
        basename = File.basename(tmp_file).split(/\.\w+$/).first
        self.location = File.join(CLIPS_URL, new_filename = "#{basename}.flv")
        Transcoder.process(tmp_file, File.join(clips_dir, new_filename), logger)
        Transcoder.thumbnail(tmp_file, File.join(clips_dir, "#{basename}_80x80.jpg"), logger)      
      end
    rescue => e
      logger.error(e.message)
      logger.error("Error occurred!!!!!!!!")
    end
  end
end
