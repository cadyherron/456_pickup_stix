class PlaylistsController < ApplicationController

  before_action :require_login, except: [:show]




  def index
    @playlists = Playlist.all
  end


  def new
    @playlist = Playlist.new
  end


  def create
    @playlist = Playlist.new(whitelisted_params)
    if @playlist.save
      flash[:success] = "playlist has been created"
      redirect_to playlist_path(@playlist)
    else
      flash[:error] = "playlist was not created"
      render :new
    end
  end


  def show
    @playlist = Playlist.find(params[:id])
  end


  def edit
    @playlist = Playlist.find(params[:id])
  end


  def update
    @playlist = Playlist.find(params[:id])
    if @playlist.update(whitelisted_params)
      flash[:success] = "playlist has been updated"
      redirect_to playlist_path(@playlist)
    else
      flash[:error] = "playlist was not updated"
      render :edit
    end
  end


  def destroy
    @playlist = Playlist.find(params[:id])
    if @playlist.destroy
      flash[:success] = "playlist was deleted"
    else
      flash[:error] = "playlist was not deleted"
    end
    redirect_to playlists_path
  end


  private
  def whitelisted_params
    params.require(:playlist).permit(:name, :user_id)
  end



end
