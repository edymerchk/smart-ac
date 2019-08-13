class DevicesController < BaseController

  def index
    @devices = Device.all
    @devices = @devices.search(params[:search][:serial]) if params.dig(:search, :serial).present?
  end

  def show
    @device = Device.find(params[:id])
    @latest_report = @device.reports.last

    @temp_graph = graph_generator.graph(:temperature)
    @monoxide_graph = graph_generator.graph(:carbon_monoxide_level)
    @air_humidity_graph = graph_generator.graph(:air_humidity)
  end

  private

  def graph_generator
    @generator ||= GraphGenerator.new(@device.reports)
  end
end
