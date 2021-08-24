class CreateBelts < ActiveRecord::Migration[6.0]
  def change
    create_table :belts do |t|
      t.references :person, null: false, foreign_key: true
      t.integer :modality
      t.integer :color
      t.date :start_date

      t.timestamps
    end
  end
end
