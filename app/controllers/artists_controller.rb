class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end


  def show
    @artist = Artist.find(params[:id])
  end





  private
  def whitelisted_params
    params.require(:artist).permit(:name)
  end



end
