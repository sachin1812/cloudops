require 'webmock/rspec'
require 'vcr_setup'

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json").
      with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
      to_return(status: 200, body: "stubbed response", headers: {})
  end
end
