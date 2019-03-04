class CreateUserTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :user_tickets do |t|
      t.references :user, foreign_key: true
      t.references :ticket, foreign_key: true
      t.integer :quantity, null: false, default: 1
      t.decimal :original_value, precision: 5, scale: 2, null: false
    end
  end
end
