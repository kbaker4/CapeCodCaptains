class AppointmentsController < ApplicationController

	def new
		@appointment = Appointment.new
	end

	def set_hours(start_time, end_time)
		#this method will create an array of the total number of hours for the day selected
		#each index in the array will a new row in the Appointment database

		#determine how many elements will be in the array
		total_hours = (end_time.to_i) - (start_time.to_i)
		hours = Array.new(total_hours)
		
		#starting with start_time, add an hour for each element in the array		
		hours.each_index do |i|
			hours[i] = ((params[:appointment][:start_time]).to_i) + i
		end
		return hours
	end

	def create
		params.require(:appointment).permit(:appt_date, :start_time, :end_time)

		#send the values from the form to the set_hours method
		new_rows = set_hours(params[:appointment][:start_time], params[:appointment][:end_time])

		#create a new row in the database for each element in the array
		0.upto(new_rows.length-1) do |i|
			a = Appointment.new
			a.appt_date = params[:appointment][:appt_date]
			a.start_time = new_rows[i]
			a.end_time = new_rows[i] + 1
			a.reserved = false
			#binding.pry
			a.save
		end

		#Put a flash here for success message

		redirect_to new_appointment_path
	end

end
