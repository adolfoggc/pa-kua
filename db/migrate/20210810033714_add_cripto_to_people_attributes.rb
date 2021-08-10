class AddCriptoToPeopleAttributes < ActiveRecord::Migration[6.0]
  def change
    # lockbox
    add_column :people, :name_ciphertext, :text
    add_column :people, :address_ciphertext, :text
    add_column :people, :birthdate_ciphertext, :text
    add_column :people, :phone_ciphertext, :text
    add_column :people, :cpf_ciphertext, :text
    add_column :people, :stard_date_ciphertext, :text

    # blind index
    add_column :people, :birthdate_bidx, :date
    add_index :people, :birthdate_bidx, unique: true
    add_column :people, :start_date_bidx, :date
    add_index :people, :start_date_bidx, unique: true

    # remove
    remove_column :people, :name
    remove_column :people, :address
    remove_column :people, :birthdate
    remove_column :people, :phone
    remove_column :people, :cpf
    remove_column :people, :start_date
  end
end
