class UsersController < ApplicationController








  private
  def whitelisted_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end


end
