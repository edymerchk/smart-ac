class AdminsController < BaseController

  def index
    @admins = Admin.all
  end
end
