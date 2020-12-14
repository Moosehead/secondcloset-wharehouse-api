class ChangeFkConstraintChargeVolumes < ActiveRecord::Migration[6.0]
  def up
    remove_foreign_key :charge_volumes , :customers
    add_foreign_key :charge_volumes, :customers, on_delete: :cascade ,null: false
  end
  
  def down
    add_foreign_key :charge_volumes, :customers
  end
end
