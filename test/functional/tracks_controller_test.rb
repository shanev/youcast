require File.dirname(__FILE__) + '/../test_helper'
require 'tracks_controller'

# Re-raise errors caught by the controller.
class TracksController; def rescue_action(e) raise e end; end

class TracksControllerTest < Test::Unit::TestCase
  fixtures :tracks, :playlists, :users

  def setup
    @controller = TracksController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
    login_as :quentin
  end

  def test_should_pass
    assert true
  end
  
  # def test_should_get_index
  #   get :index
  #   assert_response :success
  #   assert assigns(:tracks)
  # end
  # 
  # def test_should_get_new
  #   get :new
  #   assert_response :success
  # end
  
  def test_should_create_track
    assert_difference('Track.count') do
      post :create, :playlist_id => 1, :track => { :title => "title of track", :location => "http://some/location"}
    end
  
    assert_redirected_to clips_path
  end
  
  # def test_should_show_track
  #   get :show, :id => 1
  #   assert_response :success
  # end
  # 
  # def test_should_get_edit
  #   get :edit, :id => 1
  #   assert_response :success
  # end
  # 
  # def test_should_update_track
  #   put :update, :id => 1, :track => { }
  #   assert_redirected_to playlist_track_path(assigns(:track).playlist, assigns(:track))
  # end
  # 
  # def test_should_destroy_track
  #   assert_difference('Track.count', -1) do
  #     delete :destroy, :id => 1
  #   end
  # 
  #   assert_redirected_to playlist_tracks_path
  # end
end
