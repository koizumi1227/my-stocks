class StocksController < ApplicationController
  before_action :set_stock, only: %i[show edit update destroy]

  # GET /admin/stocks
  def index
    run_search(Stock)
  end

  # GET /admin/stocks/1
  def show; end

  # GET /admin/stocks/new
  def new
    @stock = Stock.new
  end

  # GET /admin/stocks/1/edit
  def edit; end

  # POST /admin/stocks
  def create
    @stock = Stock.new(stock_params)

    if @stock.save
      redirect_to @stock, notice: 'Stock was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/stocks/1
  def update
    if @stock.update(stock_params)
      redirect_to stock_url(@stock), notice: 'Stock was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/stocks/1
  def destroy
    @stock.destroy
    redirect_to stocks_url, notice: 'Stock was successfully destroyed.'
  end

  private

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:tick)
  end
end
