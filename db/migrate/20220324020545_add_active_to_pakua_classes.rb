class AddActiveToPakuaClasses < ActiveRecord::Migration[6.0]
  def change
    add_column :pakua_classes, :active, :boolean
    add_reference :pakua_classes, :person, null: false, foreign_key: true
  end
end
