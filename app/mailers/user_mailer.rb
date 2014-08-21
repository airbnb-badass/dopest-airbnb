class UserMailer < ActionMailer::Base
  default from: 'no-reply@dopestairbnb.com'

  def validation_message(user)
    @user = user
    mail(to: @user.email, subject: 'Your booking has been validated !')
  end

  def new_booking_message(user)
    @user = user
    mail(to: @user.email, subject: 'You have a new booking on your apartment !')
  end

end