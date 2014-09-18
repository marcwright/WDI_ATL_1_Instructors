class CreateHero < ActiveRecord::Migration
  def change
    create_table :heros do |t|
      t.string :name
      t.string :secret_identity
      t.string :image_url
    end
  end
end
