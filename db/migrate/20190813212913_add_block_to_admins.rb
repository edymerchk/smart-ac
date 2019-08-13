class AddBlockToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :blocked, :boolean, default: false
  end
end
