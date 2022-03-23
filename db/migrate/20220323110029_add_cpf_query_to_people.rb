class AddCpfQueryToPeople < ActiveRecord::Migration[6.0]
  def up
    remove_index :people, :email_bidx
    add_index :people, :email_bidx
    add_column :people, :cpf_bidx, :string
    add_index :people, :cpf_bidx, unique: true
  end

  def down
    remove_index :people, :email_bidx
    add_index :people, :email_bidx, unique: true
    remove_column :people, :cpf_bidx
    remove_index :people, :cpf_bidx
  end
end
