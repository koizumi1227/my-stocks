# frozen_string_literal: true

module MyStocks
  class Scraping::Article < Scraping::Base
    attr_accessor :url

    def initialize(url)
      self.url = url
    end

    def fetch
      raise "URLを設定してください" if url.blank?

      doc = parse(url)
      raise "URLに誤りがあります" unless doc

      article_hash = { title: "", description: "", url: url }
      article_hash[:title] = doc.css("h1")[0]&.text.presence || doc.title
      article_hash[:description] = doc.xpath('//meta[@name="description"]/@content').to_s

      article_hash
    end
  end
end
