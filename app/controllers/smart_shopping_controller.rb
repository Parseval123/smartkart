include SmartShoppingHelper
class SmartShoppingController < ApplicationController

  def makelist

	  if(!list_logged_in?)
	  @list = Shopper.create(:user_id => current_user.id)
	  log_list(@list)
	  else
	  @list = current_list
          end

	@products = Product.all
	@request = Request.new
	@list_requests = @list.requests


  end

  def corefunction
  end
end
