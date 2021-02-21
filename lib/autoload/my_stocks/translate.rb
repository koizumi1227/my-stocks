# frozen_string_literal: true

module MyStocks
  class Translate
    TIMEOUT = 60
    TARGET_LANGUAGE = 'ja'
    SOURCE_LANGUAGE = 'en'
    BASE_URL = 'https://script.google.com'

    attr_accessor :text

    def initialize(text)
      self.text = text
    end

    def run
      raise "翻訳するテキストがありません" if text.blank?

      response_body = client.post(path, params.to_json).body
      raise "エラーが発生しました error: #{response_body}" if response_body.include?("DOCTYPE html")

      parsed_response = JSON.parse(response_body)
      raise "エラーが発生しました error: #{parsed_response}" unless parsed_response["code"] == 200

      parsed_response["text"]
    end

    private

    def params
      {
        text: text,
        source: SOURCE_LANGUAGE,
        target: TARGET_LANGUAGE
      }
    end

    def path
      "/macros/s/#{Rails.application.credentials.dig(:gas, :application_key)}/exec"
    end

    def client
      http_request.connection(follow_redirect: true)
    end

    def http_request
      ::Http::Client.new(BASE_URL, timeout: TIMEOUT, open_timeout: TIMEOUT, headers: headers)
    end

    def headers
      { 'Content-Type' => 'application/json' }
    end
  end
end
