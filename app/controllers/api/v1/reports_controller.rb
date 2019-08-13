module Api
  module V1
    class ReportsController < BaseController
      before_action :authenticate!

      deserializable_resource :report, only: :create

      def create
        report = Report.new(format_taken_at(report_params))
        report.save!
        Notifier.new(report).notify
        render jsonapi: report, status: 201
      end

      def create_bulk
        if reports_valid? && report_objects.map{ |report| save_and_notify(report) }
          head 201
        else
          render json: { errors: {report_errors: report_errors } }, status: 422
        end
      end

      private

      def save_and_notify(report)
        report.save
        Notifier.new(report).notify
      end

      def report_params
        params.require(:report).permit(*report_attributes)
      end

      def report_errors
        report_objects.select{|r| !r.valid?}.map(&:errors)
      end

      def reports_valid?
        report_objects.all?{|r| r.valid?}
      end

      def report_objects
        params["_jsonapi"]["data"].map do |param|
          params_hash = param.require(:attributes).permit(*report_attributes)
          Report.new(format_taken_at(params_hash))
        end
      end

      def format_taken_at(hash)
        hash.merge!(taken_at: Time.at(hash[:taken_at]))
      end

      def report_attributes
        [:device_id, :temperature, :air_humidity, :carbon_monoxide_level, :health_status, :taken_at]
      end
    end
  end
end

