class CreateCartoons < ActiveRecord::Migration
  def change
    create_table :cartoons do |t|
      t.string :name
      t.string :location
      t.text :image_url
    end
  end
end
