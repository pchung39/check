class AddUserIdToTodoodoos < ActiveRecord::Migration
  def change
  	add_column :todoodoos, :user_id, :integer
  end
end
