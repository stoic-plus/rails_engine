class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  def index
    merchant_info = Merchant.favorite_merchant_for(params[:id])
    if merchant_info
      render json: MerchantSerializer.new(merchant_info)
    else
      render json: ApiErrorSerializer.new(BusinessData::ApiError.new("No merchant found", DateTime.now))
    end
  end
end
