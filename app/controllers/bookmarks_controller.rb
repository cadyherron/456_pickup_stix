class BookmarksController < ApplicationController

  before_action :require_login, only: [:create, :destroy]



  def create
    @bookmark = Bookmark.new(whitelisted_params)
    if @bookmark.save
      flash[:success] = "Bookmark has been created"
    else
      flash[:error] = "Bookmark was not created"
    end
    redirect_to :back
  end


  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:success] = "Bookmark was deleted"
    else
      flash[:error] = "Bookmark was not deleted"
    end
    redirect_to :back
  end









  private
  def whitelisted_params
    params.permit(:user_id, :bookmarkable_id, :bookmarkable_type)
  end




end
