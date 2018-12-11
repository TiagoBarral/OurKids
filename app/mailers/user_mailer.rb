class UserMailer < ApplicationMailer
  def welcome
  end

  def invite(parent, user)
    @greeting = "Hi #{parent[:coparent_name].capitalize}"
    @user = user
    mail(to: parent[:coparent_email], subject: 'Your invite to OurKids')
  end
end
