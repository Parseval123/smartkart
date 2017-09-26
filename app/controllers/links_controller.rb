class LinksController < ApplicationController
  def check

	if(session[:range]==nil)
		if(params[:session][:range]=='')
		flash[:danger] = "range field cannot be blank"
		redirect_to user_path(current_user)
		return	
		else
		session[:range] = params[:session][:range]	
		end
	end

	if(session[:address]==nil)
		if(params[:session][:address]=='')	
		flash[:danger] = "you are going to use your registration address"
		session[:address] = current_user.address   
		else
		session[:address] = params[:session][:address]	
		end
	end

	redirect_to  smart_shopping_makelist_path 

  end
end
