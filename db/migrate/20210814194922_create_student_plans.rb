class CreateStudentPlans < ActiveRecord::Migration[6.0]
  def change
    create_table :student_plans do |t|
      t.references :people, null: false, foreign_key: true
      t.references :tuition_fee, null: false, foreign_key: true
      t.references :discount, null: false, foreign_key: true
      t.string :rent_inclusion
      t.integer :due_day

      t.timestamps
    end
  end
end
