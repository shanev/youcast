require File.dirname(__FILE__) + '/../test_helper'
require 'homes_controller'

# Re-raise errors caught by the controller.
class HomesController; def rescue_action(e) raise e end; end

class HomesControllerTest < Test::Unit::TestCase
  fixtures :playlists
  
  def setup
    @controller = HomesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_should_redirect_if_user_not_logged_in
    get :show
    assert_response :redirect
  end
end
