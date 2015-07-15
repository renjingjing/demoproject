class RegistusersMailer < ApplicationMailer
  def notify_signed_up_user(user)
    @user = user
    mail(to: @user.email, subject: "Thank you for signing up")
  end
end
