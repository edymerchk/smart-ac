module Api
  module V1
    class DevicesController < BaseController
      deserializable_resource :device, only: :create

      def create
        device = Device.new(device_params)
        device.save!
        render jsonapi: device, status: 201
      end

      private

      def device_params
        params.require(:device).permit(:serial_number, :firmware_version)
      end
    end
  end
end
