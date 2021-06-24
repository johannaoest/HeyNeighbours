class AddRatedToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :employer_rated, :boolean, default: false
    add_column :bookings, :employee_rated, :boolean, default: false
  end
end
