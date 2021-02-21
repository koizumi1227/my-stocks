# frozen_string_literal: true

module MyStocks
  class Scraping::Stock < Scraping::Base
    attr_accessor :tick, :url

    def initialize(tick)
      self.url = Rails.application.credentials.dig(:scrape, :us_url)
      self.tick = tick
    end

    def fetch
      raise "URLを設定してください" if url.blank?

      doc = parse(url + tick)
      raise "tick: #{tick} は存在しません" unless doc

      company_table = doc.xpath("//div[@class='container']/table")[1]
      fundamental_table = doc.xpath("//div[@class='container']/table")[2]

      stock_hash = { company: {}, fundamental: {} }
      stock_hash[:company] = parse_company(company_table)
      stock_hash[:fundamental] = parse_fundamental(fundamental_table)

      stock_hash
    end

    def parse_company(company_table)
      parsed_company = { name: "", sector: "", industry: "", country: "" }
      parse_company_table = company_table.search('td')
      sector_industry_country_array =  parse_company_table[3].text.split(" | ")

      parsed_company[:name] = parse_company_table[2].text
      parsed_company[:sector] = sector_industry_country_array[0]
      parsed_company[:industry] = sector_industry_country_array[1]
      parsed_company[:country] = sector_industry_country_array[2]

      parsed_company
    end

    def parse_fundamental(fundamental_table)
      bind = binding
      sorted_fundamentals_constants = Stock::Fundamental.constants.sort_by { |x| x.to_s.delete("TABLE_ROW_").to_i }
      fundamental_hashes = sorted_fundamentals_constants.map do |constant|
        bind.local_variable_set(constant.to_s.underscore, {})
      end

      fundamental_table.search('tr').each.with_index(1) do |tr, i|
        fundamental_const_name = sorted_fundamentals_constants[i - 1]
        fundamental_const = Stock::Fundamental.const_get(fundamental_const_name)

        tr.search('td').each.with_index(1) do |td, ii|
          if ii.odd?
            raise "一致しません。td: #{td.text}" unless fundamental_const[(ii - 1) / 2] == td.text
          else
            fundamental_variable = bind.local_variable_get(fundamental_const_name.to_s.underscore)
            fundamental_variable[fundamental_const[(ii / 2) - 1]] = td.text
          end
        end
      end

      fundamental_hashes.each_with_object({}) do |fundamental_hash, hash|
        hash.merge!(fundamental_hash)
      end
    end
  end
end
