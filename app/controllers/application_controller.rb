class ApplicationController < ActionController

  def index
    @tickers = Ticker.all?
end

def update_price
  ticker = Ticker.find(params[:id])

  response = RestClient.get "https://yunbi.com//api/v2/tickers/#{ticker.ticker_di}" # 因为我们之前保存过币种的id值，现在可以调用啦！

data = JSON.parse(response.body)

# ticker.update(:timestamp_at => data.dig("at"),
#              :price_buy => data.dig("ticker","buy"),
#              :price_sell => data.dig("ticker","sell"),
#              :price_low => data.dig("ticker","low"),
#              :price_high => data.dig("ticekr","high"),
#              :trade_vol => data.dig("ticker","vol"),
#              :price_last => data.dig("ticker","last"),
#              current_price => data.dig("ticker","last"))

ticker.update(:timestamp_at => data["at"],
              :price_buy => data["ticker"]["buy"],
              :price_sell => data["ticker"]["sell"],
              :price_low => data["ticker"]["low"],
              :price_high => data["ticker"]["high"],
              :trade_vol => data["ticker"]["vol"],
              :price_last => data["ticker"]["last"],
              :current_price => data["ticker"]["last"])



redirect_to tickers_path
  end
end
