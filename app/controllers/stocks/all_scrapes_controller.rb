class Stocks::AllScrapesController < ApplicationController
  def update
    Stock.all_scrape

    redirect_to stocks_url, notice: '更新されました'
  end
end
