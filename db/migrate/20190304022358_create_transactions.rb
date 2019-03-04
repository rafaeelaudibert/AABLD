class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.integer :month, null: false, index: true
      t.integer :year, null: false, index: true
      t.decimal :value, precision: 6, scale: 2, default: 0.0
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
