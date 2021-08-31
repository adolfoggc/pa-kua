class AddInformationToPerson < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :information, :text
  end
end
