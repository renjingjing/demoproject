class NewsletterMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.newsletter_mailer.weekly.subject
  #
  default from: "from@example.com"

  def weekly(user)
    @greeting = "#{user.full_name}"
    mail to: user.email, subject: "Thank For Asking Our Weekly Newsletter! Art Gallery"
  end

  def weekly_all
    print(">>>>>>>>>>>>>>>>>>>")
    User.all.each do |user|
      @greeting = "#{user.full_name}"
    mail to: user.email, subject: "Thank For Asking Our Weekly Newsletter! Art Gallery"
    end
  end
end
