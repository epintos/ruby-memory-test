class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.string :value

      t.timestamps
    end
  end
end
