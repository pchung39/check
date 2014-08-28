class CreateAddAdminToRoles < ActiveRecord::Migration
  def change
    create_table :add_admin_to_roles do |t|
      t.string :admin

      t.timestamps
    end
  end
end
