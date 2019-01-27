class Api::V1::Merchants::SearchController < ApplicationController
  def index
    merchants = Merchant.where(merchant_params)
    render_error if merchants.empty?
    render json: MerchantSerializer.new(merchants) unless merchants.empty?
  end

  def show
    merchant = Merchant.find_by(merchant_params)
    render_error unless merchant
    render json: MerchantSerializer.new(merchant) if merchant
  end

  private

  def merchant_params
    params.permit(:id, :name, :created_at, :updated_at)
  end

  def render_error
    render json: ApiErrorSerializer.new(BusinessData::ApiError.new("No records found with those params", DateTime.now))
  end
end
