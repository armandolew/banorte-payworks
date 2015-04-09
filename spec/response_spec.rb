require 'spec_helper'

describe Banorte::Payworks::Response do
  it "should initialize with the body of the http response" do
    @response = Banorte::Payworks::Response.new({})
    @response.body.should be_a(Hash)
  end

  it "should look in the error code field to see if it is successful" do
    @response = Banorte::Payworks::Response.new({"CcErrCode" => "1"})
    @response.successful?.should eql true
  end


  it "should look in the error code field to see if it is unsuccessful" do
    @response = Banorte::Payworks::Response.new({"CcErrCode" => "50"})
    @response.successful?.should eql false
  end
end
