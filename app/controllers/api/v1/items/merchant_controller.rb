class Api::V1::Items::MerchantController < ApplicationController
  def index
    item = Item.find(params[:id])
    render json: MerchantSerializer.new(item.merchant)
  end
end
