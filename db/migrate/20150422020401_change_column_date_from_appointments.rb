class ChangeColumnDateFromAppointments < ActiveRecord::Migration
  def change
  	rename_column :appointments, :date, :appt_date
  end
end
