class RemoveUniquenessOnPeople < ActiveRecord::Migration[6.0]
  def up
    remove_index :people, :birthdate_bidx
    remove_index :people, :civil_status_bidx
    remove_index :people, :marketing_bidx
    remove_index :people, :school_level_bidx
    remove_index :people, :start_date_bidx
    remove_index :people, :status_bidx

    add_index :people, :birthdate_bidx
    add_index :people, :civil_status_bidx
    add_index :people, :marketing_bidx
    add_index :people, :school_level_bidx
    add_index :people, :start_date_bidx
    add_index :people, :status_bidx
  end

  def down
    remove_index :people, :birthdate_bidx
    remove_index :people, :civil_status_bidx
    remove_index :people, :marketing_bidx
    remove_index :people, :school_level_bidx
    remove_index :people, :start_date_bidx
    remove_index :people, :status_bidx

    add_index :people, :birthdate_bidx, unique: true
    add_index :people, :civil_status_bidx, unique: true
    add_index :people, :marketing_bidx, unique: true
    add_index :people, :school_level_bidx, unique: true
    add_index :people, :start_date_bidx, unique: true
    add_index :people, :status_bidx, unique: true
  end
end
