class LinksThirdController < ApplicationController
  def check

	if(session[:count]==nil)
		if(params[:session][:count]=='')
		flash[:danger] = "number of markets field cannot be blank"
		redirect_to smart_shopping_makelist_path
		return	
		else
		session[:count] = params[:session][:count]	
		end
	end

	redirect_to smart_shopping_cf_path 

  end
end
