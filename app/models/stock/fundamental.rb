class Stock::Fundamental
  TABLE_ROW_1 = %w[
    Index
    P/E
    EPS\ (ttm)
    Insider\ Own
    Shs\ Outstand
    Perf\ Week
  ]
  TABLE_ROW_2 = %w[
    Market\ Cap
    Forward\ P/E
    EPS\ next\ Y
    Insider\ Trans
    Shs\ Float
    Perf\ Month
  ]
  TABLE_ROW_3 = %w[
    Income
    PEG
    EPS\ next\ Q
    Inst\ Own
    Short\ Float
    Perf\ Quarter
  ]
  TABLE_ROW_4 = %w[
    Sales
    P/S
    EPS\ this\ Y
    Inst\ Trans
    Short\ Ratio
    Perf\ Half\ Y
  ]
  TABLE_ROW_5 = %w[
    Book/sh
    P/B
    EPS\ next\ Y
    ROA
    Target\ Price
    Perf\ Year
  ]
  TABLE_ROW_6 = %w[
    Cash/sh
    P/C
    EPS\ next\ 5Y
    ROE
    52W\ Range
    Perf\ YTD
  ]
  TABLE_ROW_7 = %w[
    Dividend
    P/FCF
    EPS\ past\ 5Y
    ROI
    52W\ High
    Beta
  ]
  TABLE_ROW_8 = %w[
    Dividend\ %
    Quick\ Ratio
    Sales\ past\ 5Y
    Gross\ Margin
    52W\ Low
    ATR
  ]
  TABLE_ROW_9 = %w[
    Employees
    Current\ Ratio
    Sales\ Q/Q
    Oper.\ Margin
    RSI\ (14)
    Volatility
  ]
  TABLE_ROW_10 = %w[
    Optionable
    Debt/Eq
    EPS\ Q/Q
    Profit\ Margin
    Rel\ Volume
    Prev\ Close
  ]
  TABLE_ROW_11 = %w[
    Shortable
    LT\ Debt/Eq
    Earnings
    Payout
    Avg\ Volume
    Price
  ]
  TABLE_ROW_12 = %w[
    Recom
    SMA20
    SMA50
    SMA200
    Volume
    Change
  ]
end
