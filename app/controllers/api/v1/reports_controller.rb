module Api
  module V1
    class ReportsController < BaseController
      before_action :authenticate!

      deserializable_resource :report, only: :create

      def create
        report = Report.new(report_params)
        report.save!
        render jsonapi: report, status: 201
      end

      def create_bulk
        if reports_valid? && report_objects.map(&:save)
          head 201
        else
          render json: { errors: {report_errors: report_errors } }, status: 422
        end
      end

      private

      def report_params
        params.require(:report).permit(:device_id, :temperature, :air_humidity, :carbon_monoxide_level, :health_status)
      end

      def report_errors
        report_objects.select{|r| !r.valid?}.map(&:errors)
      end

      def reports_valid?
        report_objects.all?{|r| r.valid?}
      end

      def report_objects
        params["_jsonapi"]["data"].map do |param|
          Report.new(param.require(:attributes).permit(:device_id, :temperature, :air_humidity, :carbon_monoxide_level, :health_status))
        end
      end
    end
  end
end

