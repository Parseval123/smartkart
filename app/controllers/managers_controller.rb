class ManagersController < ApplicationController
  before_action :logged_in_manager, only: [:show, :edit, :update]
  before_action :sign_up_manager, only: [:addmarket]

  def new
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)
    if @manager.save #registrazione con successo

          flash[:success] = "SignUp Successful as "+@manager.name+" "+@manager.surname
        
	log_in_m @manager
        redirect_to managers_addmarket_path
      

    else #registrazione senza successo
          render 'new'
        
    end
  end

  def show
    @manager = Manager.find(params[:id])
  end

  def addmarket
    @market=Market.find_by_manager_id(nil)
  end

  def edit
    @manager = Manager.find(params[:id])
  end

  def update
    @manager = Manager.find(params[:id])
    if @manager.update_attributes(manager_params)
      flash[:success] = "Profile updated"
      redirect_to @manager
    else
      render 'edit'
    end
  end

  private 
 	
	def manager_params 
	params.require(:manager).permit(:name,:surname,:tel,:yearofbirth,:email,:curriculum,:password,:password_confirmation)
	end

        def logged_in_manager
          unless logged_in_m?
            flash[:danger] = "Please log in as Manager"
            redirect_to loginm_path
          end
        end

        def sign_up_manager
          unless logged_in_m?
            flash[:danger] = "Please sign up as Manager"
            redirect_to new_manager_path
          end
        end

end
