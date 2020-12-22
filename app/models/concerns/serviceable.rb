module Serviceable
  extend ActiveSupport::Concern

  def self.fetch_pricing_info
    url = "https://pricing.us-east-1.amazonaws.com/offers/v1.0/aws/AmazonCloudFront/current/index.json"
    response = HTTParty.get(url)
  end

  def self.store_service
    response = fetch_pricing_info
      if response.code == 200
        data = JSON.parse(response)
        data["products"].each do |d|
          res_data =  Service.find_or_create_by(sku: d[1]["sku"], productFamily: d[1]["productFamily"], servicecode: d[1]["attributes"]["servicecode"], location: d[1]["attributes"]["location"], locationType: d[1]["attributes"]["locationType"],
            fromLocation: d[1]["attributes"]["fromLocation"], fromLocationType: d[1]["attributes"]["fromLocationType"],toLocation: d[1]["attributes"]["toLocation"],toLocationType: d[1]["attributes"]["toLocationType"],usagetype: d[1]["attributes"]["usagetype"],
            operation: d[1]["attributes"]["operation"], requestDescription: d[1]["attributes"]["requestDescription"], requestType: d[1]["attributes"]["requestType"], servicename: d[1]["attributes"]["servicename"], publicationDate: data["publicationDate"])
          res_data.save
        end
      end
  end

  def self.store_service_terms
    response = fetch_pricing_info
    if response.code == 200
      data = JSON.parse(response)
      data["terms"]["OnDemand"].each do |d|
        service = Service.find_by_sku(d[0])
        if service.present?
          service_term = ServiceTerm.find_by_sku(service.sku)
            if service_term.present?
              if service_term.pricePerUnit != d[1].values[0]["priceDimensions"].values[0]["pricePerUnit"]["USD"]
                res_data = service.service_terms.create(offerTermCode: d[1].values[0]["offerTermCode"], effectiveDate: d[1].values[0]["effectiveDate"], rateCode: d[1].values[0]["priceDimensions"].values[0]["rateCode"], description: d[1].values[0]["priceDimensions"].values[0]["description"],
                  beginRange: d[1].values[0]["priceDimensions"].values[0]["beginRange"], endRange: d[1].values[0]["priceDimensions"].values[0]["endRange"], unit: d[1].values[0]["priceDimensions"].values[0]["unit"], pricePerUnit: d[1].values[0]["priceDimensions"].values[0]["pricePerUnit"]["USD"], currency_code: d[1].values[0]["priceDimensions"].values[0]["pricePerUnit"].keys[0])
                  res_data.save
              end
            else
              res_data = service.service_terms.create(offerTermCode: d[1].values[0]["offerTermCode"], effectiveDate: d[1].values[0]["effectiveDate"], rateCode: d[1].values[0]["priceDimensions"].values[0]["rateCode"], description: d[1].values[0]["priceDimensions"].values[0]["description"],
                beginRange: d[1].values[0]["priceDimensions"].values[0]["beginRange"], endRange: d[1].values[0]["priceDimensions"].values[0]["endRange"], unit: d[1].values[0]["priceDimensions"].values[0]["unit"], pricePerUnit: d[1].values[0]["priceDimensions"].values[0]["pricePerUnit"]["USD"], currency_code: d[1].values[0]["priceDimensions"].values[0]["pricePerUnit"].keys[0])
                res_data.save
            end
          end
        end
      end
    end

  end
