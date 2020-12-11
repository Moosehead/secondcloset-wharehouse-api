class CreateDiscounts < ActiveRecord::Migration[6.0]
  def change
    create_table :discounts do |t|
      t.float :value
      t.integer :quantity
      t.integer :quantity_used
      t.references :customer, null: false, foreign_key: true
      t.boolean :active
      t.boolean :no_limit

      t.timestamps
    end
  end
end
