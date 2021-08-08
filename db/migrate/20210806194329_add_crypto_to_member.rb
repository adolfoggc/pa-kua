class AddCryptoToMember < ActiveRecord::Migration[6.0]
  def change
    #lockbox
    add_column :members, :email_ciphertext, :text
    
    #blind index
    add_column :members, :email_bidx, :string
    add_index :members, :email_bidx, unique: true
    
    remove_column :members, :email

  end
end
