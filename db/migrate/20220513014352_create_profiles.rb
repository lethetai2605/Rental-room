class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.datetime :dob
      t.integer :gender
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
