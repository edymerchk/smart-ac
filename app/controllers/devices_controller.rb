class DevicesController < BaseController

  def index
    @devices = Device.all
    @devices = @devices.search(params[:search][:serial]) if params.dig(:search, :serial).present?
  end

  def show
    @device = Device.find(params[:id])

    @latest_report = @device.reports.last
  end
end
