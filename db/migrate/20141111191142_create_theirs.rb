class CreateTheirs < ActiveRecord::Migration
  def change
    create_table :theirs  do |t|
      t.belongs_to :rival
      t.belongs_to :pokemon
      t.timestamps
    end
  end
end
