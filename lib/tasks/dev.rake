namespace :dev do
  # namespace 方法可以把 Rake 任务分组，这样可以避免一些命名冲突，也显得更有条理。

  task :fetch_ticker => :environment do
    #:environment 表示执行 Rake 任务时的 Rails 环境参数，默认为 development 环境，你可以通过 RAILS_ENV 参数来修改它：bundle exec rake first_student RAILS_ENV=production

    puts "Fetch ticker data..."
# Puts 就是打印显示的意思

response = RestClient.get "https://yunbi.com//api/v2/markets"
#将 rest_client 这个 gem 的用法，更多用法可以参照该 gem 的 Github 页面。注意这里抓取的数据是 JSON 格式，取决于 API 网站。

data = JSON.parse(response.body)
# 将抓过来的数据转成 ruby 格式，并存入 data 这个变量。

data.each do |m|
  existing_ticker = Ticker.find_by_ticker_id( m["id"] )
  # ticker_id 是 ticker 这个 model 的一个栏位，记录聚合 API 的城市 id

# 先确定该城市是否存在，如果不存在，则新建

  if existing_ticker.nil?
    Ticker.create!( :ticker_id => m["id"], :ticker_name => m["name"])
    # 将抓到的数据写入 ticker 这个 model

  end
end

puts "Total: #{Ticker.count} tickers"
  end
end
