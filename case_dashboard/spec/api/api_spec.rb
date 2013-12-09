require 'spec_helper'

describe "get_list" do
  it "should return json blob with two entries" do

  end
end

describe "cases" do
  before(:each) do
    @response_double = double(code: 200, body: cases_json_double)
    API::Client.connection.stub(:get).and_return(@response_double)
  end

  it "should invoke GET cases endpoint" do
    expect(API::Client.connection).to receive(:get).with("#{API::Client.api_url}/cases").and_return(@response_double)

    assert API::Client.new.cases
  end

  it "should invoke .parse on parser service class" do
    stubbed_hash = {
      "_embedded" => {
        "entries" => []
      }
    }

    JSON.stub(:parse).and_return(stubbed_hash)
    expect(CollectionResponseParser).to receive(:parse).with(stubbed_hash["_embedded"]["entries"]).and_return([])

    assert API::Client.new.cases
  end
end