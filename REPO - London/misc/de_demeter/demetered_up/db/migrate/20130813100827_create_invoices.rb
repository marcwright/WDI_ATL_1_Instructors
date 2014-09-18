class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :number
      t.decimal :price
      t.references :user

      t.timestamps
    end
    add_index :invoices, :user_id
  end
end
