class AdminsController < BaseController
  before_action :set_admin, only: [:block, :unblock]

  def index
    @admins = Admin.all
  end

  def block
    if proected_admins.include?(@admin.email)
      redirect_to :admins, notice: "#{@admin.email} is protected and can't be blocked"
    else
      @admin.update(blocked: true)
      redirect_to :admins, notice: "Admin blocked successfully"
    end
  end

  def unblock
    @admin.update(blocked: false)
    redirect_to :admins, notice: "Admin unblocked successfully"
  end

  private

  def set_admin
    @admin = Admin.find(params[:admin_id])
  end

  def proected_admins
    ENV.fetch('PROTECTED_ADMINS',"").split(",")
  end
end
