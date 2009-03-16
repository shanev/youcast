class PlaylistsController < ApplicationController

  # GET /clips/1
  # GET /clips/1.xml
  def show
    @playlist = Playlist.find(params[:id])
  
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @playlist }
    end
  end
  
  # add a clip (:id) to a playlist as a track
  # POST /playlist/add/:id  
  def add
    clip = Clip.find(params[:id])
    playlist = Playlist.find_by_user_id(current_user.id)
    playlist.tracks << Track.create!(:title => clip.title, :location => clip.location)
    flash[:notice] = 'Track was successfully created.'
    
    redirect_to clips_url
  end
end
