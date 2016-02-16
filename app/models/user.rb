class User < ActiveRecord::Base


  before_create :generate_token

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(:auth_token => self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end


  has_many :bookmarks, dependent: :destroy
  has_many :playlists, dependent: :destroy

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true, allow_nil: true



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
      redirect_to edit_user_profile_path(@user)
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
      sign_out(@user)
    else
      flash[:error] = "User was not deleted"
    end
    redirect_to users_path
  end




end
