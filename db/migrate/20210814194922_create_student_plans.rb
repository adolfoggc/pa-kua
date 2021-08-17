class CreateStudentPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :student_plans do |t|
      t.references :person, null: false, foreign_key: true
      t.integer :weekly_classes
      t.integer :kind_of_plan
      t.string :rent_inclusion
      t.integer :due_day

      t.timestamps
    end
  end
end
