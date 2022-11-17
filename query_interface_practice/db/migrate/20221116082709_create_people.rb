class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.date :birth_date
      t.references :country, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
