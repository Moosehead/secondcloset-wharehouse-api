class ChangeFkConstraintChargeValues < ActiveRecord::Migration[6.0]
  def up
    remove_foreign_key :charge_values , :customers
    add_foreign_key :charge_values, :customers, on_delete: :cascade ,null: false
  end
  
  def down
    add_foreign_key :charge_values, :customers
  end
end
