class ChangeColumnInAppointments < ActiveRecord::Migration
  def change
  	change_column :appointments, :start_time, :time
  	change_column :appointments, :end_time, :time
  end
end
