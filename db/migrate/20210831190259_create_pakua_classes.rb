class CreatePakuaClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :pakua_classes do |t|
      t.integer :modality
      t.integer :day_of_week
      t.integer :hour
      t.integer :minutes
      t.integer :duration

      t.timestamps
    end
  end
end
