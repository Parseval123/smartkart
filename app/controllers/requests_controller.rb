class RequestsController < ApplicationController

before_action :logged_in_user, only: [:create, :destroy]


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

	def logged_in_user
	      unless logged_in?
		flash[:danger] = "Please log in as User"
		redirect_to login_path
	      end
	    end
 	
	def request_params 
	params.require(:request).permit(:product_id,:shopper_id)
	end

end
