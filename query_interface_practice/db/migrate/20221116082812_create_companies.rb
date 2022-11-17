class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.references :country, null: false, foreign_key: true
      t.bigint :market_value
      t.string :name

      t.timestamps
    end
  end
end
