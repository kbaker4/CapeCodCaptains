class AppointmentsController < ApplicationController

	def new
		@appointment = Appointment.new
	end

	def create
		#send the values from the form to the set_hours method
		
		params.require(:appointment).permit(:appt_date, :start_time, :end_time)
		@date = params[:appointment][:appt_date]
		
		#determine how many elements will be in the array
		@total_hours = ((params[:appointment][:end_time]).to_i) - ((params[:appointment][:start_time]).to_i)		
		@hours = Array.new(@total_hours)
		
		#starting with start_time, add an hour for each element in the array		
		@hours.each_index do |i|
			@hours[i] = ((params[:appointment][:start_time]).to_i) + i
		end

		binding.pry
		#create a new row in the database for each element in the array
		@hours.each do |e|
			@appointment = Appointment.new
			@appointment.appt_date = @date
			@appointment.start_time = e
			@appointment.end_time = e + 1
			binding.pry
			@appointment.save
		end
		binding.pry
		redirect_to new_appointment_path
	end

end
