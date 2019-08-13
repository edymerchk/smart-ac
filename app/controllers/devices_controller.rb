class DevicesController < BaseController

  def index
    @devices = Device.all
    @devices = @devices.search(params[:search][:serial]) if params[:search][:serial].present?
  end

  def show
    @device = Device.find(params[:id])
  end
end
