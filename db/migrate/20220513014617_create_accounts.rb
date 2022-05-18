class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :email
      t.references :role, null: false, foreign_key: true, default: 3

      t.timestamps
    end
  end
end
