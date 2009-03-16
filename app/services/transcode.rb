class Transcoder
  def self.process(input, output, logger=nil)
    out = run_ffmpeg(input, output)
    logger.info out if logger
    out
  end
  
  def self.thumbnail(input, output, logger=nil)
    out = run_ffmpeg(input, output, thumbnail_options)
    logger.info out if logger
    out
  end
  
  private
    def self.run_ffmpeg(input, output, options=video_options)
      `#{FFMPEG} -y -i #{input} #{options} #{output} 2>&1`
    end
    
    def self.video_options
      "-s 320x240 -ar 22050 -r 24"
    end
    
    def self.thumbnail_options
      "-vcodec mjpeg -vframes 1 -an -f rawvideo -s 80x80"
    end
end