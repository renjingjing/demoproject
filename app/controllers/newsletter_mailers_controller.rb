class NewsletterMailersController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    NewsletterMailer.weekly(@user).deliver_now
  end

end
