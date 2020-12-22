require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'services' do
    let(:service_response) { Serviceable.fetch_pricing_info }
    it "returns pricing data", :vcr do
      expect(service_response).to be_kind_of(String)
      expect(service_response.code) == 200
    end
  end
end
