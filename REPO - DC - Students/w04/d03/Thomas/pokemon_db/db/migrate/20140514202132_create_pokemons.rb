class CreatePokemons < ActiveRecord::Migration
  def change
    create_table :pokemons do |t|
      t.string :name
      t.text :image_url
      t.string :attack
    end
  end
end
