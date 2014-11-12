class CreateOurs < ActiveRecord::Migration
  def change
    create_table :ours do |t|
      t.belongs_to :player
      t.belongs_to :pokemon
      t.timestamps
    end
  end
end
