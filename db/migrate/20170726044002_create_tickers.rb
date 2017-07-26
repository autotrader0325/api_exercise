class CreateTickers < ActiveRecord::Migration[5.0]
  def change
    create_table :tickers do |t|
      t.string :ticker_id
      t.string :ticker_name
      t.integer :timestamp_at
      t.string :price_buy
      t.string :price_sell
      t.string :price_low
      t.string :price_high
      t.string :price_last
      t.string :trade_vol
      t.string :current_price
      t.timestamps
    end
  end
end
