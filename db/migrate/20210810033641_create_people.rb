class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :address
      t.date :birthdate
      t.string :phone
      t.string :cpf
      t.integer :role
      t.date :start_date

      t.timestamps
    end
  end
end
