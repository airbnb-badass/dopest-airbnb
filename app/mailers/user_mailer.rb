class UserMailer < ActionMailer::Base
  default from: 'no-reply@dopestairbnb.com'

  def validation_message(user)
    @user = user
    mail(to: @user.email, subject: 'Your booking has been validated !')
  end
end