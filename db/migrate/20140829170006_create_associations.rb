class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.integer :user_id
      t.string :email
      t.integer :role_id
      t.timestamps
    end
  end
end
