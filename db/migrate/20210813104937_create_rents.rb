class CreateRents < ActiveRecord::Migration[6.0]
  def change
    create_table :rents do |t|
      t.decimal :rental_amount
      t.date :starts_at

      t.timestamps
    end
  end
end
