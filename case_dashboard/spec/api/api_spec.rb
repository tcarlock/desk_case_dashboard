require 'spec_helper'

describe "get cases" do
  context "success response" do
    let(:response_double) { double(code: 200, body: cases_json_double) }

    before(:each) do
      API::Client.connection.stub(:get).and_return(response_double)
    end

    it "should invoke GET cases endpoint" do
      expect(API::Client.connection).to receive(:get).with("#{API::Client.api_url}/cases").and_return(response_double)

      API::Client.new.cases
    end

    it "should invoke .parse on parser service class" do
      stubbed_hash = {
        "_embedded" => {
          "entries" => []
        }
      }

      parsed_cases = double

      JSON.stub(:parse).and_return(stubbed_hash)
      CollectionResponseParser.stub(:parse).and_return(parsed_cases)
      expect(CollectionResponseParser).to receive(:parse).with(stubbed_hash["_embedded"]["entries"])

      API::Client.new.cases.should eq(parsed_cases)
    end
  end
end

describe "add label to case" do
  context "success response" do
    let(:response_double) { double(code: 200, body: '{}') }

    before do
      expect(API::Client.connection).to receive(:request).with("PATCH", "#{API::Client.api_url}/case/1", { labels: 'test' }).and_return(response_double)
    end

    it "should invoke PATCH cases endpoint" do
      API::Client.new.add_label_to_case 1, 'test'
    end

    it "should return true" do
      API::Client.new.add_label_to_case(1, 'test').should eq(true)
    end
  end

  context "failure response" do
    let(:response_double) { double(code: 500, body: '{}') }

    before do
      expect(API::Client.connection).to receive(:request).with("PATCH", "#{API::Client.api_url}/case/1", { labels: 'test' }).and_return(response_double)
    end

    it "should invoke PATCH cases endpoint" do
      API::Client.new.add_label_to_case 1, 'test'
    end

    it "should return false" do
      API::Client.new.add_label_to_case(1, 'test').should eq(false)
    end
  end
end

describe "update case" do
  it "should add label" do

  end
end

describe "CollectionResponseParser" do
  it "should parse a hash into an object" do
    stubbed_hash = [{
      "subject" => "test",
      "_links" => {
        "self" => {
          "href" => "https://desk.com/cases/1"
        }
      }
    }]

    CollectionResponseParser.parse(stubbed_hash).first.subject.should eq('test')
    CollectionResponseParser.parse(stubbed_hash).first.id.should eq(1)
  end
end