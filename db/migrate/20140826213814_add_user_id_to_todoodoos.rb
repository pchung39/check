class AddUserIdToTodoodoos < ActiveRecord::Migration
  def change
  	add_column :user_id
  end
end
