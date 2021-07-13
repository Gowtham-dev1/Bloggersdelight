class BanAlertMailer < ApplicationMailer

  def ban_alert_email
    @user = params[:email]
    mail(to: @user, subject: "Your account is banned")
  end
  def unban_alert_email
    @user = params[:email]
    mail(to: @user, subject: "Your account is unbanned")
  end
end
