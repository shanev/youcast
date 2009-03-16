class HomesController < ApplicationController
  before_filter :login_required
  
  # GET /home
  def show
    @url_for_media_player = 
    @playlist = Playlist.find_or_create_by_user_id(current_user.id)
  end
end
