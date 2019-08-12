module Api
  module V1
    class BaseController < ApplicationController
      include AuthenticationFilter
      include JsonApiErrors
    end
  end
end
