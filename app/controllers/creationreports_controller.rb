class CreationreportsController < ApplicationController

  def confirm

  @creationreport = Creationreport.find(params[:session][:id])

	  if(@creationreport.nil?)
		flash[:danger] = "someone has already approved this market"
		redirect_to current_admin
	  else
	 	@market = Market.find(@creationreport.market_id)
		@market.update_attribute(:status, true)
		@manager = Manager.find(@creationreport.manager_id)
		@manager.update_attribute(:market_id, @market.id)
		@market.update_attribute(:status, true)
		Creationreport.destroy(@creationreport.id)
		flash[:success] = "confirmation sent"
		redirect_to current_admin
	  end

  end

  def deny

 @creationreport = Creationreport.find(params[:session][:id])

	  if(@creationreport.nil?)
		flash[:danger] = "someone has already denied this market"
		redirect_to current_admin
	  else
		@market = Market.find(@creationreport.market_id)
		@market.update_attribute(:status, false)
		@manager = Manager.find(@creationreport.manager_id)
		@manager.update_attribute(:market_id, @market.id) 
		Creationreport.destroy(@creationreport.id)
		flash[:success] = " market has been refused successfully"
		redirect_to current_admin
	  end


  end

end
