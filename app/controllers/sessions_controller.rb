class SessionsController < ApplicationController
  def new
  end
  
  def create
    # Find the user in the DB by email address
    user = User.find_by(email: params[:session][:email].downcase)
    
    # Returns true only if the user is found and the password is valid
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page
      log_in user
      redirect_to user
    else
      # Create an error message
      flash.now[:danger] = "Invalid email/password combination" 
      render 'new'
    end
  end
  
  def destroy
  end
  
end
