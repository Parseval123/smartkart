include SmartShoppingHelper

class SmartShoppingController < ApplicationController

before_action :logged_in_user, only: [:makelist, :corefunction]

  def makelist

 session.delete(:count)

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

	if(!list_logged_in?)

        redirect_to smart_shopping_makelist_path

        else   

				if(session[:address].nil?)
				flash[:danger] = "please insert a valid address"	
				redirect_to user_path(current_user)
				return			
				end

		@requested_products = current_list.products

		if(@requested_products.size == 0)

		flash[:danger] = "your list must contain at least one product"
		redirect_to smart_shopping_makelist_path
		return 

		end

	@markets = nearMarkets(session[:address],session[:range])

	if(@markets.size == 0)
		flash[:danger] = "error during geocoding, please re-enter your address"
		redirect_to user_path(current_user)
		return
	end

        

	@count = session[:count]

		if(@count.to_i>@markets.size)
		@count = @markets.size
		end

	if(@count.to_i <= 0)
	
	flash[:danger] = "you must enter a number of markets major than zero"
		redirect_to smart_shopping_makelist_path
		return
	
	end

        @markets_subsets = @markets.combination(@count.to_i)
	@cardinal = @markets_subsets.size

	@result = nil
	@sum = 10000

		@markets_subsets.each do |mark_sub|
	
		@temp = aux_function(@requested_products,mark_sub)

			if(@requested_products.size == ((@temp.size)-1))

					if(@temp.last < @sum.to_f)
					@result = @temp     
					@sum = @result.pop
					end

			
			end 
	
		end

	
		if(@result.nil?)
	
		flash[:danger] = "most of the products aren't in the range below, please enter a major range for the research"
		redirect_to user_path(current_user)
		return
		end
       
	end

  end

  private 

  def aux_function (list_product,nearmarks)
	
	@final_array = Array.new()
	@tot_cost = 0;
       
 	list_product.each do |product|
 
	
	@price = 1000;
	@own_temp = nil
	
		nearmarks.each do |mark|
		@own_act = Owner.find_by(:product_id => product.id,:market_id => mark.id)
			if(@own_act!=nil) #test per controllare se un supermercato possiede effettivamente un prodotto
				if(@own_act.price<@price)
				@own_temp = @own_act
				@price = @own_act.price
				end	
						
			end
	
		end

		if(@own_temp!=nil)
				@tot_cost = @tot_cost + @price
				@final_array.push(@own_temp)
        	end
	end

	@final_array.push(@tot_cost)
	return @final_array


  end

  def smartshop_params

  params.require(:session).permit(:range,:address)

  end

   def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in as User"
        redirect_to login_path
      end
    end

end
