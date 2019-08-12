module JsonApiErrors
  extend ActiveSupport::Concern

  included do
    rescue_from(StandardError, with: ->(_) { jsonapi_error(500, error_500) })
    rescue_from(ActiveRecord::RecordInvalid, with: ->(e) { jsonapi_error(422, ar_invalid(e.message)) })
    rescue_from(AuthenticationFilter::UnauthorizedError, with: ->(e) { jsonapi_error(401, error_401(e.message)) })
    rescue_from(ActionController::ParameterMissing, with: ->(e) { jsonapi_error(400, error_400(e.message)) })
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

  def error_400(message)
    {
      title:  "Bad request",
      detail: message,
      code:   "400",
      status: "400"
    }
  end

  def error_500(message = "An unknown error occurred")
    {
      title:  "Unknown error",
      detail: message,
      code:   "500",
      status: "500"
    }
  end

  def ar_invalid(message)
    {
      title:  "Validation failed",
      detail: message,
      code:   "422",
      status: "422"
    }
  end
end
