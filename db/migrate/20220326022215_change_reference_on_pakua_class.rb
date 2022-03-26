class ChangeReferenceOnPakuaClass < ActiveRecord::Migration[6.0]
  def change
    remove_reference :pakua_classes, :person
    add_reference :pakua_classes, :person, foreign_key: true
  end
end
