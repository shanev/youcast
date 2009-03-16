require File.dirname(__FILE__) + '/../test_helper'

class ClipTest < Test::Unit::TestCase
  fixtures :clips, :playlists
  
  def test_should_validate_presence_of_user
    clip = Clip.create(:title => "My title", :location => "some location")
    assert_equal clip.errors.full_messages.to_s, "User can't be blank"
  end
  
  def test_should_copy_mp3_to_user_directory
    Clip.create :uploaded_data => fixture_file_upload( @@FIXTURE_MP3 )
    
    uploaded_file = File.join(RAILS_ROOT, "public", "system", "hardons.mp3")
    assert File.exist?(uploaded_file)
    FileUtils.rm_f uploaded_file
  end
   
  def test_should_transcode_uploaded_file
    Clip.create :uploaded_data => fixture_file_upload( @@FIXTURE_VIDEO )
  
    assert File.exist?(File.join(RAILS_ROOT, "public", "system", "Angry.flv"))    
  end   
end
