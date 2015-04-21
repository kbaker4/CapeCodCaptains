class AppointmentsController < ApplicationController

	def new
		@appointment = Appointment.new
	end

	def set_hours(end_time, start_time)
		#take the total amount of hours for the day and seperate them into an array of 1 hour segments
		total_hours = (end_time + 1) - start_time
		@hours = Array.new(total_hours)
		
		#starting with start_time, add an hour for each element in the array		
		@hours.each_index do |i|
			@hours[i] = start_time + i
		end

		return @hours
	end

	def create
		#send the values from the form to the set_hours method
		set_hours(params[:end_time],params[:start_time])

		#create a new row in the database for each element in the array
		@hours.each do |e|
			@appointment = Appointment.new
			@appointment.date = params[:date]
			@appointment.start_time = e
		end

		redirect_to appointment_new_path
	end

end
