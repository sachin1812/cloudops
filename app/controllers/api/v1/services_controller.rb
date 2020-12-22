class Api::V1::ServicesController < ApplicationController
  def store_pricing
    response = Service.pricing_data
    render json: {"response": "success"}
  end

  def get_pricing
    res = Service.pricing(params[:date],params[:servicecode],params[:location])
    render json: {"response": res}
  end

  def create_service
    service = Service.new service_params

    if service.save
      render json: {
                "success": true,
                "message": 'Service added!',
                "response": service
              },status: 200
    else
      render json: {
                "success": false,
                "message": 'Error!',
                "response": service.errors.full_messages
              }
    end
  end

private
    def service_params
      params.require(:service).permit(:sku,:productFamily,:servicecode,:location,:locationType,:usagetype,:operation,:requestDescription,:requestType,:servicename,:publicationDate )
    end
end
