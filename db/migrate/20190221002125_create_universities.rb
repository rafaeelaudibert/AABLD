class CreateUniversities < ActiveRecord::Migration[5.2]
  def change
    create_table :universities do |t|
      t.string :name
      t.string :cnpj, index: true
      t.references :city, foreign_key: true
      t.string :neighborhood
      t.string :address
    end
  end
end
