class CreateRoomDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :room_details do |t|
      t.time :checkin
      t.time :checkout
      t.date :startday
      t.date :endday
      t.text :description
      t.string :bedroom

      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
