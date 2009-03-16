require File.dirname(__FILE__) + '/../../test_helper'
require 'transcode'

class TranscoderTest < Test::Unit::TestCase

  def setup
    remove_temp_video_files
  end
  
  def test_should_transcode_h_263_amr_narrowband
    assert_transcode "Angry.3gp"
  end
  
  def test_should_transcode_mpeg1_muxed
    assert_transcode "Keechu.mpg"
  end
  
  def test_should_transcode_wmv
    assert_transcode "andrew1.wmv"
  end
  
  def test_should_transcode_avi
    assert_transcode "dcha-preview.avi"
  end
  
  # def test_should_transcode_aac_mpeg4_video_mpeg4_sdsm_mpeg4_odsm
  #   assert_transcode "google2.mp4"
  # end
  # 
  # def test_should_transcode_aac_h_264_jpeg
  #   assert_transcode "jojomayermd2005.mov"
  # end
  
  def teardown
    remove_temp_video_files
  end
  
  private
    def assert_transcode(video)
      input = "#{RAILS_ROOT}/test/fixtures/files/#{video}"
      output = "#{RAILS_ROOT}/tmp/video.flv"
      results = Transcoder.process(input, output, logger) 
      %w( FFmpeg bitrate video ).each { |good_keyword| assert results =~ /#{good_keyword}/ }
      %w( Unsupported corrupted).each { |bad_keyword| assert results !~ /#{bad_keyword}/ }
      assert File.size?(output)      
    rescue Exception => e
      logger.error results
      raise e
    end
    
    def remove_temp_video_files
      tmp_dir = File.join(RAILS_ROOT, "tmp", "*.flv")
      FileUtils.rm_f Dir[tmp_dir]      
    end
end
