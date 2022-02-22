class UsersController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, except: [:new]
  helper_method :current_user
  

  def show
    # keep for going to a profile page later
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_user_in(@user)
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    # keep for editing a profile later
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    # keep for ending profile later
  end

  private

  def user_params
    params.require(:user).permit(:id, :first_name, :last_name, :username, :email, :password_digest)
  end




end
