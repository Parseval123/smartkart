class SessionsmController < ApplicationController
  def new
  end

  def create
    manager = Manager.find_by(email: params[:session][:email].downcase)
    if manager && manager.authenticate(params[:session][:password]) #log in sucesso
      log_in_m(manager)
      redirect_to manager  
    else #log in fallito
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out_m
    redirect_to root_path
  end
end
