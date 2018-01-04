class UsersController < ApplicationController

  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:show,:edit, :update]

  def show
	@user = User.find(params[:id])
 	session.delete(:range)
	session.delete(:address)
	session.delete(:list_id)
	session.delete(:range2)
	session.delete(:address2)
  end

  def new
  	@user = User.new
  end
	
  def index 
  	redirect_to new_user_path
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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private 
 	
    def user_params 
      params.require(:user).permit(:name,:surname,:address,:yearofbirth,:email,:password,:password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in as User"
        redirect_to login_path
      end
    end

   def correct_user
   @user = User.find(params[:id])
   redirect_to current_user unless @user = current_user?(@user)
   end

end
