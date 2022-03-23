class AddEmailQueryToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :email_bidx, :string
    add_index :people, :email_bidx, unique: true
  end
end
