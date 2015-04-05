class AddFieldsToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :date, :date
    add_column :appointments, :start_time, :string
    add_column :appointments, :end_time, :string
    add_column :appointments, :reserved, :boolean
    add_column :appointments, :name, :string
  end
end
