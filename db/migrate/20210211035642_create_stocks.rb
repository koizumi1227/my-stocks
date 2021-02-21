class CreateStocks < ActiveRecord::Migration[6.0]
  def change
    # TODO: tableを切り分ける
    create_table :stocks do |t|
      t.string :tick, null: false
      t.string :company_name
      t.string :sector
      t.string :industry
      t.string :country

      t.float :per
      t.float :eps

      t.float :market_cap
      t.float :forward_per
      t.float :eps_estimate_next_year

      t.float :income
      t.float :peg
      t.float :eps_estimate_next_quarter
      t.float :short_float

      t.float :sales
      t.float :psr
      t.float :eps_current_year
      t.float :short_ratio

      t.float :bps
      t.float :pbr
      t.float :eps_next_year
      t.float :roa
      t.float :target_price

      t.float :cfps
      t.float :pcfr
      t.float :eps_next_5_year
      t.float :roe

      t.float :dividend
      t.float :pfcfr
      t.float :eps_past_5_year
      t.float :roi
      t.float :beta

      t.float :dividend_yield
      t.float :quick_ratio
      t.float :sales_past_5_year
      t.float :gross_margin
      t.float :atr

      t.float :current_ratio
      t.float :sales_q_q
      t.float :operating_margin
      t.float :rsi_14

      t.float :der
      t.float :eps_q_q
      t.float :profit_margin
      t.float :rel_volume

      t.float :lt_der
      t.float :payout
      t.float :price

      t.float :recom
      t.float :sma_20
      t.float :volume
      t.float :change_price_ratio

      t.timestamps
    end
  end
end
