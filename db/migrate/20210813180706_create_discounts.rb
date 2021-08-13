class CreateDiscounts < ActiveRecord::Migration[6.0]
  def change
    create_table :discounts do |t|
      t.decimal :discount_percentage
      t.date :starts_at
      t.integer :kind_of_plan

      t.timestamps
    end
  end
end
