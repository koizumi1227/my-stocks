class Stocks::ScrapeController < ApplicationController
  before_action :set_stock

  def update
    notice = @stock.save_from_scrape ? '更新されました' : '更新に失敗しました'

    redirect_to stocks_url, notice: notice
  end

  def set_stock
    @stock = Stock.find(params[:id])
  end
end
