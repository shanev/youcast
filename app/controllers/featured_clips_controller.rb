class FeaturedClipsController < ApplicationController
  before_filter :login_required
  before_filter :find_playlist
  
  # GET /clips
  # GET /clips.xml
  def index
    @clips = Clip.find_all_by_user_id_and_featured(current_user.id, true)
  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @clips }
    end
  end

  # GET /clips/new
  # GET /clips/new.xml
  def new
    @clip = Clip.new
    @your_email = "#{current_user.login}@filmprmail.com"

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @clip }
    end
  end

  # POST /clips
  # POST /clips.xml
  def create
    @clip = Clip.new(params[:clip])
    @clip.user_id = current_user.id
    
    respond_to do |format|
      if @clip.save
        flash[:notice] = 'Clip was successfully created.'
        format.html { redirect_to home_url }
        format.xml  { render :xml => @clip, :status => :created, :location => @clip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @clip.errors }
      end
    end
  end

  def find_playlist
    @playlist = Playlist.find_by_user_id(current_user.id)
  end
  
end
