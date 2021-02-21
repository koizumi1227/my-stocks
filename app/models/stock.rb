class Stock < ApplicationRecord
  def self.all_scrape
    find_each do |stock|
      stock.save_from_scrape

      sleep Random.rand(1..2)
    end
  end

  def save_from_scrape
    stock_data = MyStocks::Scraping::Stock.new(tick).fetch

    set_company_data(stock_data[:company])
    set_fundamental_data(stock_data[:fundamental])

    save
  end

  private

  def set_company_data(company_data)
    self.company_name = company_data[:name]
    self.sector = company_data[:sector]
    self.industry = company_data[:industry]
    self.country = company_data[:country]
  end

  def set_fundamental_data(fundamental_data)
    self.per = fundamental_data[Stock::Fundamental::TABLE_ROW_1[1]]
    self.eps = fundamental_data[Stock::Fundamental::TABLE_ROW_1[2]]

    self.market_cap = align_unit(fundamental_data[Stock::Fundamental::TABLE_ROW_2[0]])
    self.forward_per = fundamental_data[Stock::Fundamental::TABLE_ROW_2[1]]
    self.eps_estimate_next_year = fundamental_data[Stock::Fundamental::TABLE_ROW_2[2]]

    self.income = align_unit(fundamental_data[Stock::Fundamental::TABLE_ROW_3[0]])
    self.peg = fundamental_data[Stock::Fundamental::TABLE_ROW_3[1]]
    self.eps_estimate_next_quarter = fundamental_data[Stock::Fundamental::TABLE_ROW_3[2]]
    self.short_float = fundamental_data[Stock::Fundamental::TABLE_ROW_3[4]]

    self.sales = align_unit(fundamental_data[Stock::Fundamental::TABLE_ROW_4[0]])
    self.psr = fundamental_data[Stock::Fundamental::TABLE_ROW_4[1]]
    self.eps_current_year = fundamental_data[Stock::Fundamental::TABLE_ROW_4[2]]
    self.short_ratio = fundamental_data[Stock::Fundamental::TABLE_ROW_4[4]]

    self.bps = fundamental_data[Stock::Fundamental::TABLE_ROW_5[0]]
    self.pbr = fundamental_data[Stock::Fundamental::TABLE_ROW_5[1]]
    self.eps_next_year = fundamental_data[Stock::Fundamental::TABLE_ROW_5[2]]
    self.roa = fundamental_data[Stock::Fundamental::TABLE_ROW_5[3]]
    self.target_price = fundamental_data[Stock::Fundamental::TABLE_ROW_5[4]]

    self.cfps = fundamental_data[Stock::Fundamental::TABLE_ROW_6[0]]
    self.pcfr = fundamental_data[Stock::Fundamental::TABLE_ROW_6[1]]
    self.eps_next_5_year = fundamental_data[Stock::Fundamental::TABLE_ROW_6[2]]
    self.roe = fundamental_data[Stock::Fundamental::TABLE_ROW_6[4]]

    self.dividend = fundamental_data[Stock::Fundamental::TABLE_ROW_7[0]]
    self.pfcfr = fundamental_data[Stock::Fundamental::TABLE_ROW_7[1]]
    self.eps_past_5_year = fundamental_data[Stock::Fundamental::TABLE_ROW_7[2]]
    self.roi = fundamental_data[Stock::Fundamental::TABLE_ROW_7[3]]
    self.beta = fundamental_data[Stock::Fundamental::TABLE_ROW_7[5]]

    self.dividend_yield = fundamental_data[Stock::Fundamental::TABLE_ROW_8[0]]
    self.quick_ratio = fundamental_data[Stock::Fundamental::TABLE_ROW_8[1]]
    self.sales_past_5_year = fundamental_data[Stock::Fundamental::TABLE_ROW_8[2]]
    self.gross_margin = fundamental_data[Stock::Fundamental::TABLE_ROW_8[3]]
    self.atr = fundamental_data[Stock::Fundamental::TABLE_ROW_8[5]]

    self.current_ratio = fundamental_data[Stock::Fundamental::TABLE_ROW_9[1]]
    self.sales_q_q = fundamental_data[Stock::Fundamental::TABLE_ROW_9[2]]
    self.operating_margin = fundamental_data[Stock::Fundamental::TABLE_ROW_9[3]]
    self.rsi_14 = fundamental_data[Stock::Fundamental::TABLE_ROW_9[4]]

    self.der = fundamental_data[Stock::Fundamental::TABLE_ROW_10[1]]
    self.eps_q_q = fundamental_data[Stock::Fundamental::TABLE_ROW_10[2]]
    self.profit_margin = fundamental_data[Stock::Fundamental::TABLE_ROW_10[3]]
    self.rel_volume = fundamental_data[Stock::Fundamental::TABLE_ROW_10[4]]

    self.lt_der = fundamental_data[Stock::Fundamental::TABLE_ROW_11[1]]
    self.payout = fundamental_data[Stock::Fundamental::TABLE_ROW_11[3]]
    self.price = fundamental_data[Stock::Fundamental::TABLE_ROW_11[5]]

    self.recom = fundamental_data[Stock::Fundamental::TABLE_ROW_12[0]]
    self.sma_20 = fundamental_data[Stock::Fundamental::TABLE_ROW_12[1]]
    self.volume = fundamental_data[Stock::Fundamental::TABLE_ROW_12[4]]
    self.change_price_ratio = fundamental_data[Stock::Fundamental::TABLE_ROW_12[5]]
  end

  def align_unit(unit_data)
    unit_data[-1] == "B" ? unit_data.to_f : unit_data.to_f / 1000
  end
end

# == Schema Information
#
# Table name: stocks
#
#  id                        :bigint           not null, primary key
#  tick                      :string(255)      not null
#  company_name              :string(255)
#  sector                    :string(255)
#  industry                  :string(255)
#  country                   :string(255)
#  per                       :float(24)
#  eps                       :float(24)
#  market_cap                :float(24)
#  forward_per               :float(24)
#  eps_estimate_next_year    :float(24)
#  short_float               :float(24)
#  income                    :float(24)
#  peg                       :float(24)
#  eps_estimate_next_quarter :float(24)
#  sales                     :float(24)
#  psr                       :float(24)
#  eps_current_year          :float(24)
#  short_ratio               :float(24)
#  bps                       :float(24)
#  pbr                       :float(24)
#  eps_next_year             :float(24)
#  roa                       :float(24)
#  target_price              :float(24)
#  cfps                      :float(24)
#  pcfr                      :float(24)
#  eps_next_5_year           :float(24)
#  roe                       :float(24)
#  dividend                  :float(24)
#  pfcfr                     :float(24)
#  eps_past_5_year           :float(24)
#  roi                       :float(24)
#  beta                      :float(24)
#  dividend_yield            :float(24)
#  quick_ratio               :float(24)
#  sales_past_5_year         :float(24)
#  gross_margin              :float(24)
#  atr                       :float(24)
#  current_ratio             :float(24)
#  sales_q_q                 :float(24)
#  operating_margin          :float(24)
#  rsi_14                    :float(24)
#  der                       :float(24)
#  eps_q_q                   :float(24)
#  profit_margin             :float(24)
#  rel_volume                :float(24)
#  lt_der                    :float(24)
#  payout                    :float(24)
#  price                     :float(24)
#  recom                     :float(24)
#  sma_20                    :float(24)
#  volume                    :float(24)
#  change_price_ratio        :float(24)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
