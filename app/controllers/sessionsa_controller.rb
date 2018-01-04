class SessionsaController < ApplicationController

  def new
  end

  def create
  admin = Admin.find_by(email: params[:session][:email].downcase)
	  if admin && admin.authenticate(params[:session][:password]) #log in successo
	  log_in_a(admin)
	  redirect_to admin  
	  else #log in fallito
	  flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
	  render 'new'
	  end
  end
 
 def destroy
 log_out_a
 redirect_to root_path
 end
  
end
