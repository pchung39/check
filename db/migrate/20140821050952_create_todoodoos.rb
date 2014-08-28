class CreateTodoodoos < ActiveRecord::Migration
  def change
    create_table :todoodoos do |t|
      t.string :name
      t.boolean :done
      t.timestamps
    end

end
