class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  def index
    customer_info = Customer.favorite_customer_for(params[:id])
    if customer_info
      render json: CustomerSerializer.new(customer_info)
    else
      render json: ApiErrorSerializer.new(BusinessData::ApiError.new("No customer found", DateTime.now))
    end
  end
end
