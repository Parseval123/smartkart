class OwnersController < ApplicationController

before_action :logged_in_manager, only: [:create, :destroy]

def create

	@owner = Owner.create(owners_params)
        redirect_to manager_path(current_manager.id)

end

def destroy

Owner.find(params[:id]).destroy
    flash[:success] = "product deleted successfully"
   redirect_to manager_path(current_manager.id)

end

def edit
 @owner = Owner.find(params[:id])
end

def update
 @owner = Owner.find(params[:id])

  if(@owner.update_attributes(owners_params))
  flash[:success] = "owner updated"
  redirect_to manager_path(current_manager)
  else
  render 'edit'
  end
end

private

def owners_params
 
	params.require(:owner).permit(:product_id,:market_id,:price,:stock)
	
end

 def logged_in_manager
          unless logged_in_m?
            flash[:danger] = "Please log in as Manager"
            redirect_to loginm_path
          end
        end

end
