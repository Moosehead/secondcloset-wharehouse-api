class CreateChargeFees < ActiveRecord::Migration[6.0]
  def change
    create_table :charge_fees do |t|
      t.float :value

      t.timestamps
    end
  end
end
