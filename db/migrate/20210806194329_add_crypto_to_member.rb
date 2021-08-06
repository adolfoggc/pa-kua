class AddCryptoToMember < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :email_ciphertext, :text
    add_column :members, :email_bidx, :string
    remove_column :members, :email
  end
end
