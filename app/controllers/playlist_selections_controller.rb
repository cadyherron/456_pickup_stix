class PlaylistSelectionsController < ApplicationController

  before_action :require_login




  def create
    @playlist = Playlist.new(whitelisted_params)
    if @playlist.save
      flash[:success] = "Playlist has been created"
    else
      flash[:error] = "Playlist was not created"
    end
    redirect_to :back
  end


  def destroy
    @playlist = Playlist.find(params[:id])
    if @playlist.destroy
      flash[:success] = "playlist was deleted"
    else
      flash[:error] = "playlist was not deleted"
    end
    redirect_to :back
  end









  private
  def whitelisted_params
    params.permit(:song_id, :playlist_id)
  end



end
