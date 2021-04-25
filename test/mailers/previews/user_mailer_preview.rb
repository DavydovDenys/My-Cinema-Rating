class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    user = User.find(2)
    UserMailer.welcome_email(user)
  end
end