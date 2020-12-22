class Api::V1::ServiceTermsController < ApplicationController

  def create_service_term
    service = Service.find_by_sku service_term_params[:sku]
    if service.present?
      service_term = ServiceTerm.new service_term_params
      if service_term.save
        render json: {
                       "success": true,
                       "message": 'Service Term added!',
                       "response": service_term
                     }
      else
        render json: {
                       "success": false,
                       "message": 'Error!',
                       "response": service_term.errors.full_messages
                     }
      end
    else
      render json: {
                     "success": false,
                     "message": 'Service not present for this SKU!',
                   }
    end
  end

private
  def service_term_params
    params.require(:service_term).permit(:sku,:offerTermCode,:effectiveDate,:rateCode,:description,:beginRange,:endRange,:unit,:pricePerUnit,:currency_code )
  end
end
