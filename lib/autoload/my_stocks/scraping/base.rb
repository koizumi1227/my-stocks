# frozen_string_literal: true

module MyStocks
  class Scraping::Base
    require 'nokogiri'
    require 'open-uri'
    require 'kconv'
    require 'active_record'

    def parse(url)
      html = URI.open(url, "r:binary").read

      Nokogiri::HTML.parse(html.toutf8, nil, 'utf-8')
    rescue OpenURI::HTTPError => e
      puts e
      false
    end
  end
end
