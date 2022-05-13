class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :email
      t.references :role, null: true, foreign_key: true

      t.timestamps
    end
  end
end
