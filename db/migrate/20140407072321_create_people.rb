class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :maiden_name
      t.datetime :date_of_birth
      t.datetime :date_of_death

      t.timestamps
    end
  end
end
