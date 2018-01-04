class MicropostreportsController < ApplicationController

 def create

 @micropostreport = Micropostreport.new(:micropost_id => params[:session][:micropost_id],:user_id => params[:session][:user_id])
 
	 if(@micropostreport.save)
	 flash[:success] = "micropost successfully reported"
	 redirect_to Market.find(Micropost.find(params[:session][:micropost_id]).market_id)

	 else
	 flash[:danger] = "someone else has already reported this micropost"
	 redirect_to Market.find(Micropost.find(params[:session][:micropost_id]).market_id)

	 end

end


end
