# frozen_string_literal: true

module Http
  class Client
    DEFAULT_TIMEOUT = 60

    def initialize(url, options = {})
      @url = url
      @timeout = options.fetch(:timeout, DEFAULT_TIMEOUT)
      @open_timeout = options.fetch(:open_timeout, DEFAULT_TIMEOUT)
      @headers = options.fetch(:headers, {})
      @basic_auth = options.fetch(:basic_auth, {})
    end

    # rubocop:disable  Metrics/ParameterLists
    def connection(retry_count: 3, url_encoded: true, multipart: false, ssl_verify: true, basic_auth: false, follow_redirect: false)
      conn = Faraday.new(@url, ssl: { verify: ssl_verify }) do |f|
        yield(f) if block_given?
        f.request :retry, max: retry_count
        f.request :url_encoded if url_encoded
        f.request :multipart if multipart

        if follow_redirect
          f.response :follow_redirects
          f.adapter :net_http
        else
          f.adapter Faraday.default_adapter
        end
      end
      conn.options.timeout = @timeout
      conn.options.open_timeout = @open_timeout
      headers = conn.headers
      conn.headers = headers.merge(@headers)
      conn.basic_auth(@basic_auth[:user_id], @basic_auth[:password]) if basic_auth

      conn
    end
    # rubocop:enable  Metrics/ParameterLists

    def get(path)
      request(:get, path)
    end

    def post(path, params = {}.to_json)
      request(:post, path, params)
    end

    def put(path)
      request(:put, path)
    end

    private

    def request(method, path, params = nil)
      Retryable.retryable(tries: 5, sleep: 1, on: [Net::OpenTimeout, Net::ReadTimeout]) do
        res = connection.send(method, path, params)
        Oj.load(res.body)
      rescue Oj::ParseError => e
        Raven.capture_exception(e)
        {}
      end
    end
  end
end
