class AddStartDateToPeople < ActiveRecord::Migration[6.0]
  def change
    remove_column :people, :stard_date_ciphertext
    add_column :people, :start_date_ciphertext, :text
  end
end
