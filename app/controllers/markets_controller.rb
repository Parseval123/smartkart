class MarketsController < ApplicationController

  def show
    @market = Market.find(params[:id])
    @microposts = @market.microposts.paginate(page: params[:page])
  end

end
