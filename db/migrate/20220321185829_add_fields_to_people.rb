class AddFieldsToPeople < ActiveRecord::Migration[6.0]
  def change

    # lockbox
    add_column :people, :school_level_ciphertext, :text
    add_column :people, :occupation_ciphertext, :text
    add_column :people, :civil_status_ciphertext, :text
    add_column :people, :marketing_ciphertext, :text
    add_column :people, :other_option_ciphertext, :text
    add_column :people, :cep_ciphertext, :text

    # blind index
    add_column :people, :school_level_bidx, :integer
    add_index :people, :school_level_bidx, unique: true
    add_column :people, :marketing_bidx, :integer
    add_index :people, :marketing_bidx, unique: true
    add_column :people, :civil_status_bidx, :integer
    add_index :people, :civil_status_bidx, unique: true
  end
end
