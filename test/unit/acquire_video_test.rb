require File.dirname(__FILE__) + '/../test_helper'

class AcquireVideoTest < Test::Unit::TestCase
  fixtures :users, :clips, :tracks
  
  def test_truth
    assert true
  end
  FIXTURES_PATH = File.dirname(__FILE__) + '/../fixtures'
  CHARSET = "utf-8"
  
  include ActionMailer::Quoting
  
  def setup
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  
    @expected = TMail::Mail.new
    @expected.set_content_type "text", "plain", { "charset" => CHARSET }
    @expected.mime_version = '1.0'
  end
  
  def test_should_process_sprint_mms_attached_video_video
    assert_difference 'Clip.count' do
      email_text = read_fixture("test_video").join
      AcquireVideo.receive(email_text)
    end
  end

  private
    def read_fixture(action)
      IO.readlines("#{FIXTURES_PATH}/acquire_video/#{action}")
    end
  
    def encode(subject)
      quoted_printable(subject, CHARSET)
    end
end
