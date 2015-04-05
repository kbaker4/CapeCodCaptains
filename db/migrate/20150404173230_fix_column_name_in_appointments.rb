class FixColumnNameInAppointments < ActiveRecord::Migration
  def change
  	rename_column :appointments, :type, :lesson_type
  end
end
