class ManagersController < ApplicationController
  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)
    if @manager.save #registrazione con successo

          flash[:success] = "SignUp Successful as "+@manager.name+" "+@manager.surname
        
	log_in_m @manager
        redirect_to @manager
      

    else #registrazione senza successo
          render 'new'
        
    end
  end

  def show
    @manager = Manager.find(params[:id])
  end

  private 
 	
	def manager_params 
	params.require(:manager).permit(:name,:surname,:tel,:yearofbirth,:email,:curriculum,:password,:password_confirmation)
	end

end
