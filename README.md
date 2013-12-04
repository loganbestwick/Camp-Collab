potluck
=======

The Final Project of the Event Handlers

#Need route to create host

#Change root path to login or display events

#The great has_many debate




<!-- mailer_notes.txt

Thus hast the great Loueth spoken:

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.mandrill.com',
  port:                 587,
  domain:               'example.com',
  user_name:            '<username>',
  password:             '<password>',
  authentication:       'plain',
  enable_starttls_auto: true

Rails Docs Example:

class UserMailer < ActionMailer::Base
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

A SO link about ActionMailer mass emails:

http://stackoverflow.com/questions/9533104/send-emails-to-multiple-recipients-actionmailer
 -->