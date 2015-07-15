class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def new
    @user = User.new
    # 1.times {@user.avatars.build}
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      RegistusersMailer.notify_signed_up_user(@user).deliver_now
      redirect_to root_path, notice: "Logged In!"
    else
      render :new
    end
  end

  def edit
    @user     = current_user
  end

  def update
    @user = current_user
    if !@user.authenticate(params[:user][:current_password])
      flash[:alert] = "You've entered the wrong password"
      render :edit
    elsif @user.update(user_params)
      redirect_to edit_users_path, notice: "Information updated"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                  # :avatar,
                                  :password, :password_confirmation,:address1,:address2,:note,
                                  {avatars_attributes:[:avatar, :id, :_destroy]})
  end
end
