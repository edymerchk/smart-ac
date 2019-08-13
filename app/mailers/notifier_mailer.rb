class NotifierMailer < ApplicationMailer

  def send_health_alert(report)
    @report = report
    @device = report.device

    mail(to: recipients, subject: 'Health alert in Device')
  end


  def send_monoxide_alert(report)
    @report = report
    @device = report.device

    mail(to: recipients, subject: 'Carbon Monoxide Level alert in Device')
  end

  private

  def recipients
    Admin.all.pluck(:email)
  end
end
