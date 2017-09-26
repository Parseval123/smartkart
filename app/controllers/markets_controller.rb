class MarketsController < ApplicationController

include MarketsHelper

  def new
  @market = Market.new
  end

  def show
    @market = Market.find(params[:id])
    @microposts = @market.microposts.paginate(page: params[:page])
  end

  def create 
  
    @market = Market.new(market_params)
	
	
    if @market.save 
	
        flash[:success] = "market added with success"+@market.group
       
	current_manager.update_attribute(:market_id, @market.id)

        redirect_to manager_path(current_manager.id)
      

    else 
          render 'new'

    end
  end

  def indexmarkets

	 #controlli sui campi
       if(params[:session][:range]=='')
         flash[:danger] = "Range is empty"
         redirect_to user_path(current_user)
       end
       if(params[:session][:address]=='')
         flash.now[:success] = "Use local address"
         session[:address] = current_user.address
       else
         session[:address] = params[:session][:address]
       end
       @markets = nearMarkets(session[:address],params[:session][:range])
    
  end

private

  def market_params 
      params.require(:market).permit(:group,:address,:info)
    end

  def micropost_params 
      params.require(:micropost).permit(:content,:vote)
  end

end
