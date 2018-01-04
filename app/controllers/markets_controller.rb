include MarketsHelper

class MarketsController < ApplicationController

before_action :logged_in_manager, only: [:create, :new]
before_action :logged_in_user, only:[:show, :indexmarkets]


  def new
    if (current_manager.market_id!=nil)
      Market.destroy(current_manager.market_id)
      current_manager.update_attribute(:market_id, nil)
      @market = Market.new
    elsif(!Creationreport.find_by(:manager_id => current_manager.id).nil?)
      flash[:danger] = "you cannot add any market until your creation report in unsolved"
      redirect_to current_manager
    else
      @market = Market.new
    end
  end

  def show
    @market = Market.find(params[:id])
    @microposts = @market.microposts.paginate(page: params[:page])
  end

  def create 
  
    @market = Market.new(market_params)
	
    if (@market.save)

	if(@market.latitude.nil?)
	flash[:danger] = t("your address does not exist")
	Market.destroy(@market.id)
	redirect_to new_market_path
	
        else
        Creationreport.create(:market_id => @market.id, :manager_id => current_manager.id)
	flash[:success] = t("wait the approvation of our admins, refresh your page in 5 minutes")
	#current_manager.update_attribute(:market_id, @market.id)
        redirect_to manager_path(current_manager.id)
	end      

    else 
        render 'new'
    end
  end

  def indexmarkets

       @markets = nearMarkets(session[:address2],session[:range2])
	if(@markets.size == 0)
	flash[:danger] = "address or range invalid please type again"
	redirect_to current_user        
	end
    
  end

private

   def market_params 
      params.require(:market).permit(:group,:address,:info)
   end

   def micropost_params 
      params.require(:micropost).permit(:content,:vote)
   end 

   def logged_in_manager
          unless logged_in_m?
            flash[:danger] = "Please log in as Manager"
            redirect_to loginm_path
          end
   end

   def has_already_a_market
	unless current_manager.market_id.nil?
	flash[:danger] = "you already have a market use the valid option to change it"
	redirect_to manager_path(current_manager.id)
	end
   end	 

   def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in as User"
        redirect_to login_path
      end
   end
  

end
