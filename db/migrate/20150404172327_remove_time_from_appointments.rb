class RemoveTimeFromAppointments < ActiveRecord::Migration
  def change
    remove_column :appointments, :time, :time
  end
end
