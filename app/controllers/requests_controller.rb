class RequestsController < ApplicationController

def create
   @request = Request.create(request_params)
   redirect_to smart_shopping_makelist_path
end

def destroy
    Request.find(params[:id]).destroy
    flash[:success] = "product deleted successfully"
    redirect_to smart_shopping_makelist_path
end

private 
 	
	def request_params 
	params.require(:request).permit(:product_id,:shopper_id)
	end

end
