module Api
  module V1
    class BaseController < ApplicationController
      protect_from_forgery with: :null_session

      include AuthenticationFilter
      include JsonApiErrors
    end
  end
end
