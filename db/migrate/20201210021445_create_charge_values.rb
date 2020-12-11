class CreateChargeValues < ActiveRecord::Migration[6.0]
  def change
    create_table :charge_values do |t|
      t.float :value
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
