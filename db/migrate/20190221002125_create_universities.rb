class CreateUniversities < ActiveRecord::Migration[5.2]
  def change
    create_table :universities do |t|
      t.string :name, null: false
      t.string :abbreviation, index: true, null: false
      t.string :cnpj, index: true, null: false
      t.references :city, foreign_key: true
      t.string :neighborhood, default: 'Não se aplica'
      t.string :address, default: 'Não se aplica'
    end
  end
end
