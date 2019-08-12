module Api
  module V1
    class ReportsController < BaseController
      before_action :authenticate!

      deserializable_resource :report, only: :create

      def create
        report = Report.new(report_params)
        report.save!
        render jsonapi: report, status: 201
      rescue ActiveRecord::RecordInvalid
        head 422
      end

      private

      def report_params
        params.require(:report).permit(:device_id, :temperature, :air_humidity, :carbon_monoxide_level, :health_status)
      end
    end
  end
end
