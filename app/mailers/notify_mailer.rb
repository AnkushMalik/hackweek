class NotifyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notify_mailer.notify_kudos.subject
  #
  def notify_kudos(user,actor,project)
    @user = user
    @actor = actor
    @project = project

    mail to: @user.email, subject: @actor.name + 'upvoted your project'
  end
end
