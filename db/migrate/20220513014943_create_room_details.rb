class CreateRoomDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :room_details do |t|
      t.datetime :checkin
      t.datetime :checkout
      t.datetime :startday
      t.datetime :endday
      t.text :description
      t.string :bedroom

      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
