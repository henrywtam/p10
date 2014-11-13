class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string    :name
      t.integer   :pkdx_id
      t.string    :type
      t.integer   :height
      t.integer   :weight
      t.integer   :attack
      t.integer   :defense
      t.integer   :speed
      t.integer   :hp
      t.timestamps
    end
  end
end
