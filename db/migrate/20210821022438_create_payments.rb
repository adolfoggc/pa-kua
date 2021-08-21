class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :student_plan, null: false, foreign_key: true
      t.boolean :paid
      t.decimal :payment_fee
      t.date :due_date
      t.string :payment_link

      t.timestamps
    end
  end
end
