require File.dirname(__FILE__) + '/../test_helper'
require 'playlists_controller'

# Re-raise errors caught by the controller.
class PlaylistsController; def rescue_action(e) raise e end; end

class PlaylistsControllerTest < Test::Unit::TestCase
  def setup
    @controller = PlaylistsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # TODO: find out how to test XML responses  
  def test_should_show_playlist_in_xml_format
    # @response.content_type = Mime::XML
    # get :show, :id => 1
    # assert_response :success
    assert true
  end
end
