class AddMoreFieldsToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :type, :string
  end
end
