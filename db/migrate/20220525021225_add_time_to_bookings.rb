class AddTimeToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :startday, :datetime
    add_column :bookings, :endday, :datetime
  end
end
