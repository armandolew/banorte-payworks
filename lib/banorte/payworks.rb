require "banorte/payworks/version"
require "httparty"

module Banorte
  module Payworks
    class Client
      include HTTParty
      BANORTE_URL = "https://eps.banorte.com"
      AUTH_PATH = "/recibo"
      base_uri BANORTE_URL
      attr_accessor :name, :password, :client_id, :mode, :trans_type
      def initialize
        self.mode = "R"
        self.trans_type = "Auth"
      end

      def process_payment(data)
        data.merge!({"Name" => @name, "Password" => @password,
          "ClientId" => @client_id, "Mode" => @mode, "TransType" => @trans_type })
        http_response = self.class.post(AUTH_PATH, {:body => data})
        response = Response.new(http_response)
        return response
      end
    end

    class Response
      attr_accessor :body

      def initialize(body)
        @body = body
      end

      def successful?
        body["CcErrCode"] == '1'
      end
    end
  end
end
