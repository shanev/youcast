class TracksController < ApplicationController
  # GET /tracks
  # GET /tracks.xml
  def index
    @tracks = Track.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tracks }
    end
  end

  # GET /tracks/1
  # GET /tracks/1.xml
  def show
    @track = Track.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @track }
    end
  end

  # GET /tracks/new
  # GET /tracks/new.xml
  def new
    @track = Track.new
    @track.playlist = current_user.playlist

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @track }
    end
  end

  # GET /tracks/1/edit
  def edit
    @track = Track.find(params[:id])
  end

  # POST /playlist/1/tracks
  def create
    @track = Track.new(params[:track])

    respond_to do |format|
      if @track.save
        flash[:notice] = 'Track was successfully created.'
        format.html { redirect_to clips_url }
        format.xml  { render :xml => @track, :status => :created, :location => @track }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @track.errors }
      end
    end
  end

  # PUT /tracks/1
  # PUT /tracks/1.xml
  def update
    @track = Track.find(params[:id])

    respond_to do |format|
      if @track.update_attributes(params[:track])
        flash[:notice] = 'Track was successfully updated.'
        format.html { redirect_to playlist_track_url(@track.playlist.id, @track) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @track.errors }
      end
    end
  end

  # DELETE /tracks/1
  # DELETE /tracks/1.xml
  def destroy
    @track = Track.find(params[:id])
    @track.destroy

    respond_to do |format|
      format.html { redirect_to(tracks_url) }
      format.xml  { head :ok }
    end
  end
end
