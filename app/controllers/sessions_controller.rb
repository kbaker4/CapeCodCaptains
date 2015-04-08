class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		# Log the user in and redirect back to home page with the create new appt shown
  		log_in user
  		redirect_to root_path
  	else
  		# Create an error message
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
  	log_out
  	redirect_to root_path
  end

end
