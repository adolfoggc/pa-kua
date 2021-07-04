class AddProfileToMember < ActiveRecord::Migration[6.0]
  def change
    add_column :members, :profile, :integer
  end
end
