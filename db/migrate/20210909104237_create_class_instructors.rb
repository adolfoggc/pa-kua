class CreateClassInstructors < ActiveRecord::Migration[6.0]
  def change
    create_table :class_instructors do |t|
      t.integer :instructor
      t.references :pakua_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
