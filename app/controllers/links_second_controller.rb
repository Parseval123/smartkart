class LinksSecondController < ApplicationController
  def check

	if(session[:range2]==nil)
		if(params[:session][:range2]=='')
		flash[:danger] = "range field cannot be blank"
		redirect_to user_path(current_user)
		return	
		else
		session[:range2] = params[:session][:range2]	
		end
	end

	if(session[:address2]==nil)
		if(params[:session][:address2]=='')	
		flash[:danger] = "you are going to use your registration address"
		session[:address2] = current_user.address   
		else
		session[:address2] = params[:session][:address2]	
		end
	end

	redirect_to indexmarkets_path 

  end
end
