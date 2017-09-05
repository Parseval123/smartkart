class UsersController < ApplicationController

  def show
	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
        @user = User.new(user_params)
    	if @user.save #registrazione con successo

          flash[:success] = "SignUp Successful as "+@user.name+" "+@user.surname
        
	log_in @user
        redirect_to @user
      

        else #registrazione senza successo
          render 'new'
        
        end
  
  end

	private 
 	
	def user_params 
	params.require(:user).permit(:name,:surname,:address,:yearofbirth,:email,:password,:password_confirmation)
	end

end
