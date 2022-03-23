class AddEmailToPeople < ActiveRecord::Migration[6.0]
  def change

    # lockbox
    add_column :people, :email_ciphertext, :text
    add_column :people, :status_ciphertext, :text

    # blind index
    add_column :people, :status_bidx, :integer
    add_index :people, :status_bidx, unique: true
  end
end
