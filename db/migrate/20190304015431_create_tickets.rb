class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :source_city, references: :city
      t.references :destination_city, references: :city
      t.decimal :value, precision: 5, scale: 2, default: 0.0
      t.references :bus_company, foreign_key: true

      t.timestamps
    end
  end
end
