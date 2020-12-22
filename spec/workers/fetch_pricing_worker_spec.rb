require 'rails_helper'
RSpec.describe FetchPricingWorker, type: :worker do
  describe 'fetch_pricing_worker' do
    let(:fetch_pricing_worker_response) { FetchPricingWorker.perform_async }
    it "returns response", :vcr do
      expect(fetch_pricing_worker_response).to be_kind_of(String)
    end
  end
end
