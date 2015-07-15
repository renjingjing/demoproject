class NewsletterMailerController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    NewsletterMailer.weekly(@user).deliver_now
    redirect_to root_path, notice: "Newsletter was send!"
  end
end
