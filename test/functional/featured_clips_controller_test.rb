require File.dirname(__FILE__) + '/../test_helper'
require 'featured_clips_controller'

# Re-raise errors caught by the controller.
class FeaturedClipsController; def rescue_action(e) raise e end; end

class FeaturedClipsControllerTest < Test::Unit::TestCase
  def setup
    @controller = FeaturedClipsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
