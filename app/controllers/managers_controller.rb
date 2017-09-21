class ManagersController < ApplicationController

  before_action :logged_in_manager, only: [:show, :edit, :update]
  before_action :correct_manager, only: [:show, :edit, :update]

  def new
    @manager = Manager.new
  end

  def create

    @manager = Manager.new(manager_params)

    if @manager.save #registrazione con successo

        flash[:success] = "SignUp Successful as "+" "+@manager.name+" "+@manager.surname
	log_in_m @manager
        redirect_to new_market_path
      
    else #registrazione senza successo

          render 'new'
 
    end

  end

  def show

    @owner = Owner.new
    @products = Product.all
    @list_owners = current_manager.market.owners

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

        def market_params 
        params.require(:market).permit(:group,:address,:info)
        end
 	
	def manager_params 
	params.require(:manager).permit(:name,:surname,:tel,:yearofbirth,:email,:curriculum,:password,:password_confirmation)
	end

        def logged_in_manager
          unless logged_in_m?
            flash[:danger] = "Please log in as Manager"
            redirect_to loginm_path
          end
        end

	   def correct_manager
	   @manager = Manager.find(params[:id])
	   redirect_to(root_url) unless @manager = current_manager?(@manager)
	   end

end
