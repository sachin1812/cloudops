class FetchPricingWorker
  include Sidekiq::Worker
  sidekiq_options :queue => :default , :retry => 1

  def perform
    puts "Fetching Pricing Data==>"
    Service.pricing_data
    puts "Done====>"
  end
end
