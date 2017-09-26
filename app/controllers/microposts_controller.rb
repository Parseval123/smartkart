class MicropostsController < ApplicationController

  def new
    @market = Market.find(params[:marketid])
    @micropost = Micropost.new
  end

  def create
    @micropost = Micropost.new(micropost_params)

    if @micropost.save
      flash[:success] = "micropost added with success"
      redirect_to market_path(@micropost.market_id)
    else
      @temp_params = micropost_params
      @market = Market.find(@temp_params[:market_id])
      redirect_to controller: 'microposts', action: 'index', marketid: @market.id
    end
  end

  def index
  @market = Market.find(params[:marketid])
  @micropost = Micropost.new
  render 'new'
  end

private

  def micropost_params 
      params.require(:micropost).permit(:content,:vote,:user_id,:market_id)
    end

end
