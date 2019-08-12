module JsonApiErrors
  extend ActiveSupport::Concern

  included do
    rescue_from(AuthenticationFilter::UnauthorizedError, with: ->(e) { jsonapi_error(401, error_401(e.message)) })
  end

  private

  def jsonapi_error(code, details)
    render status: code, json: { errors: [details], jsonapi: { version: 1.0 } }
  end

  def error_401(message)
    {
      title:  "Authorization token is invalid",
      detail: message,
      code:   "401",
      status: "401"
    }
  end
end
