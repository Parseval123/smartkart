class OwnersController < ApplicationController

def create

	@owner = Owner.create(owners_params)
        redirect_to manager_path(current_manager.id)
end

def destroy

Owner.find(params[:id]).destroy
    flash[:success] = "product deleted successfully"
   redirect_to manager_path(current_manager.id)

end

private

def owners_params
 
	params.require(:owner).permit(:product_id,:market_id,:price,:stock)
	
end

end
