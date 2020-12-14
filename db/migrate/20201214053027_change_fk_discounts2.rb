class ChangeFkDiscounts2 < ActiveRecord::Migration[6.0]
  def up
    remove_foreign_key :discounts , :customers
    add_foreign_key :discounts, :customers, on_delete: :cascade ,null: false
  end
  
  def down
    add_foreign_key :discounts, :customers, null: false
  end
end
