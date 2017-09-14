class MicropostsController < ApplicationController

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)

    if @micropost.save
      flash[:success] = "micropost added with success"
      @micropost.update_attribute(:user_id, current_user.id)
      redirect_to market_path
    else
      render 'new'
    end
  end

private

  def micropost_params 
      params.require(:micropost).permit(:content,:vote)
    end

end
