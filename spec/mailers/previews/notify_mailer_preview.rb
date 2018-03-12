# Preview all emails at http://localhost:3000/rails/mailers/notify_mailer
class NotifyMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notify_mailer/notify_kudos
  def notify_kudos
    NotifyMailer.notify_kudos
  end

end
