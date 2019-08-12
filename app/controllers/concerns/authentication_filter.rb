module AuthenticationFilter
  extend ActiveSupport::Concern

  UnauthorizedError = Class.new(StandardError)

  def authenticate!
    raise UnauthorizedError unless auth_header.present?
    raise UnauthorizedError unless Device.where(token: auth_header).exists?
  end

  def auth_header
    request.headers["HTTP_AUTHORIZATION"]
  end
end
