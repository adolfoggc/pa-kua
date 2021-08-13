class CreateTuitionFees < ActiveRecord::Migration[6.0]
  def change
    create_table :tuition_fees do |t|
      t.integer :weekly_classes
      t.decimal :fee
      t.date :validity

      t.timestamps
    end
  end
end
