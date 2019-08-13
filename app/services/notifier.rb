class Notifier

  WARNING_STATUS = ["needs_service", "needs_new_filter", "gas_leak"]
  WARNING_MONOXIDE_LEVEl = 9

  def initialize(report)
    @report = report
  end

  def notify
    send_health_alert if WARNING_STATUS.include? @report.health_status
    send_monoxide_alert if @report.carbon_monoxide_level > WARNING_MONOXIDE_LEVEl
  end

  private

  def send_health_alert
    NotifierMailer.send_health_alert(@report).deliver
  end

  def send_monoxide_alert
    NotifierMailer.send_health_alert(@report).deliver
  end
end
