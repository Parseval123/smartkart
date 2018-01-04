class MicropostreportsController < ApplicationController

before_action :logged_in_user, only:[:create]

 def create
   @micropostreport = Micropostreport.new(:market_id => params[:session][:market_id],:user_id => params[:session][:user_id])
     if(@micropostreport.save)
       flash[:success] = "micropost successfully reported"
       redirect_to Market.find(micropostreport_params[:market_id])
     else
       flash[:danger] = "unable to report, please try later"
       redirect_to Market.find(micropostreport_params[:market_id])
     end
 end

private 

	def logged_in_user
	    unless logged_in?
		flash[:danger] = "Please log in as User"
		redirect_to login_path
	    end
	end
	  

end
