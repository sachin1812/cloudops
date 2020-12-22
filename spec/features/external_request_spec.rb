require 'spec_helper'
require 'httparty'
describe 'External request' do
  it 'queries FactoryGirl contributors on GitHub' do
    uri = URI('https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json')

    response = HTTParty.get(uri)

    expect(response).to be_an_instance_of(String)
  end
end
