module MarketsHelper

def nearMarkets(addr1,range)
market = Market.near(addr1,range)
return market
end

end
