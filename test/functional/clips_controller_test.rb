require File.dirname(__FILE__) + '/../test_helper'
require 'clips_controller'

# Re-raise errors caught by the controller.
class ClipsController; def rescue_action(e) raise e end; end

class ClipsControllerTest < Test::Unit::TestCase
  fixtures :clips, :users, :playlists

  def setup
    @controller = ClipsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    
    login_as :quentin
  end

  # def test_should_get_index
  #   get :index
  #   assert_response :success
  #   assert assigns(:clips)
  # end

  def test_should_get_new
    get :new
    assert_response :success
    assert_template 'clips/new'
    assert_not_nil assigns(:your_email)
  end
  
  def test_should_create_clip
    assert_difference 'Clip.count' do
      post :create, :clip => { :title => "My video", :uploaded_data => fixture_file_upload( @@FIXTURE_VIDEO ) }
      FileUtils.rm_f @@TEMP_VIDEO
    end    
    assert_redirected_to home_url
  end
   
  # def test_should_show_clip
  #   get :show, :id => 1
  #   assert_response :success
  # end
  # 
  # def test_should_get_edit
  #   get :edit, :id => 1
  #   assert_response :success
  # end
  # 
  # def test_should_update_clip
  #   put :update, :id => 1, :clip => { }
  #   assert_redirected_to clip_path(assigns(:clip))
  # end
  # 
  # def test_should_destroy_clip
  #   old_count = Clip.count
  #   delete :destroy, :id => 1
  #   assert_equal old_count-1, Clip.count
  #   
  #   assert_redirected_to clips_path
  # end
end
