class UsersController < ApplicationController


  before_action :require_login, only: [:edit, :update, :destroy]




  def index
    @users = User.all
  end


  def new
    @user = User.new
  end


  def create
    @user = User.new(whitelisted_params)
    if @user.save
      flash[:success] = "User has been created"
      sign_in(@user)
      redirect_to root_path
    else
      flash[:error] = "User was not created"
      render :new
    end
  end


  def show
    @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(whitelisted_params)
      flash[:success] = "User has been updated"
      redirect_to user_path(@user)
    else
      flash[:error] = "User was not updated"
      render :edit
    end
  end


  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:success] = "User was deleted"
      sign_out
      redirect_to root_path
    else
      flash[:error] = "User was not deleted"
      redirect_to :back
    end
  end









  private
  def whitelisted_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


end
