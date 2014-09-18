class CreateToys < ActiveRecord::Migration
  def change
    create_table :toys do |t|
      t.string      :name
      t.references  :dog
      t.text        :photo_url

      t.timestamps
    end
  end
end
