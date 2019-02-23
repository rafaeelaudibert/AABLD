class UpdateUsers < ActiveRecord::Migration[5.2]
    def change
        change_table :users do |t|
            t.string :name, null: false
            t.string :cpf, index: true, limit: 14   # Non-nullity defined on model
            t.string :rg, index: true, limit: 10    # Non-nullity defined on model
            t.date :birthdate                       # Non-nullity defined on model
            t.string :father_name, default: 'Não consta'
            t.string :mother_name                   # Non-nullity defined on model
            t.string :address, default: ''          # Non-nullity defined on model
            t.string :phone, default: 'Não consta'  # Non-nullity defined on model
            t.string :mobile_phone, default: 'Não consta'   # Non-nullity defined on model
            t.string :bank_account                  # Non-nullity defined on model
            t.string :bank_agency                   # Non-nullity defined on model
            t.integer :bank_option                  # Non-nullity defined on model
            t.references :university, index: true
            t.string :course                        # Non-nullity defined on model
            t.integer :semester                     # Non-nullity defined on model
            t.string :place                         # Non-nullity defined on model
            t.date :semester_start                  # Non-nullity defined on model
            t.date :semester_end                    # Non-nullity defined on model
            t.integer :ticket_responsible_id, index: true
            t.integer :role, index: true            # Non-nullity defined on model
        end
            
        add_foreign_key :users, :users, column: :ticket_responsible_id
    end
end
  