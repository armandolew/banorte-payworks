require 'spec_helper'

describe Banorte::Payworks::Client do
  before :each do
    @client = Banorte::Payworks::Client.new
  end
  describe "constants urls and paths" do
    it "should have the banorte url" do
      Banorte::Payworks::Client::BANORTE_URL.should eql "https://eps.banorte.com"
    end

    it "should have a path for the auth service" do
      Banorte::Payworks::Client::AUTH_PATH.should eql "/recibo"
    end

    it "should have a field for name, password and client id, mode and trans type" do
      @client.name.should eql nil
      @client.password.should eql nil
      @client.client_id.should eql nil
      @client.mode.should eql "R"
      @client.trans_type.should eql "Auth"
    end
  end

  describe "payment transactions" do

    before :each do
      @client.name = "user_test"
      @client.password = "user01"
      @client.client_id = "19"
    end

    it "should process a payment without errors" do
      result = @client.process_payment({})
      result.successful?.should eql false
    end

    it "should not process a payment with an order without errors" do
      @client.mode = "N"
      response = @client.process_payment({"Number" => "4111111111111111", "Expires" => "01/16",
        "Cvv2Indicator" => "1", "Cvv2Val" => "000", "Total" => ".10",
        "PoNumber" => "12345", "ChargeDesc1" => "Cargo por un Chicle"})
      response.class.should eql Banorte::Payworks::Response
      response.successful?.should eql false
    end

    it "should process a payment with an order without errors" do
      @client.mode = "Y"
      response = @client.process_payment({"Number" => "4111111111111111", "Expires" => "01/16",
        "Cvv2Indicator" => "1", "Cvv2Val" => "000", "Total" => ".10",
        "PoNumber" => "12345", "ChargeDesc1" => "Cargo por un Chicle"})
      response.class.should eql Banorte::Payworks::Response
      response.successful?.should eql true
    end

  end
end
