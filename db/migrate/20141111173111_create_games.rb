class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.belongs_to :player
      t.belongs_to :rival
      t.timestamps
    end
  end
end
