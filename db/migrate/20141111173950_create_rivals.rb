class CreateRivals < ActiveRecord::Migration
  def change
    create_table :rivals do |t|
      t.string :name
      t.timestamps
    end
  end
end
