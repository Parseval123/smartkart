class AdminsController < ApplicationController

before_action :logged_in_admin, only: [:show, :deleteuser, :deletemicropost, :resetrequest]

	  def show

	  @creationreports = Creationreport.all
	  @micropostreports = Micropostreport.all

	  end

	  def deleteuser

		if(params.has_key?(:one) && params.has_key?(:two))
		redirect_to current_admin
		return
		end		

	  @micropostreports = Micropostreport.find(params[:session][:id])
	  @user = User.find(@micropostreports.user_id)	
	  @microposts = Micropost.where(:user_id => @user.id)
          @microposts.each do |micro| 
		@var1 = Micropostreport.find_by(:micropost_id => micro.id)
		if(!@var1.nil?)
		Micropostreport.destroy(@var1.id)		
		end
	Micropost.destroy(micro.id)
	 end
	User.destroy(@user.id)

	redirect_to current_admin

	 	

	 # User.destroy(@micropostreports.user_id)
	 # Micropostreport.destroy(@micropostreports.id)
	 # redirect_to current_admin

	  end

	  def deletemicropost

	  @micropostreports = Micropostreport.find(params[:session][:id])
	  Micropost.destroy(@micropostreports.micropost_id)
	  Micropostreport.destroy(@micropostreports.id)
	  redirect_to current_admin


	  end
 
	  def resetrequest

	  Request.destroy_all
	  flash[:success] = "all request destroyed"
	  redirect_to current_admin

	  end


  private

	  def logged_in_admin
		unless logged_in_a?
		  flash[:danger] = "Please log in as Admin"
		  redirect_to logina_path
		end
          end


end
