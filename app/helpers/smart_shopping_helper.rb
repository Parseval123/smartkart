module SmartShoppingHelper

def nearMarkets(addr1,range)
market = Market.near(addr1, range)
return market
end

def log_list(list)
session[:list_id] = list.id
end

def current_list
@current_list ||= Shopper.find_by(id: session[:list_id])
end

def list_logged_in?
!current_list.nil?
end





end
