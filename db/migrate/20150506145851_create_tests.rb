class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :first_value
      t.string :second_value
      t.timestamps null: false
    end

    add_index :tests, [:id]
  end
end
