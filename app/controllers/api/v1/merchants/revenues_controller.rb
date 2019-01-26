class Api::V1::Merchants::RevenuesController < ApplicationController
  include BusinessData
  def index
    total_revenue = Invoice.total_revenue_by_date(params[:date])
    if total_revenue
      render json: TotalRevenueForDateSerializer.new(BusinessData::TotalRevenueForDate.new(total_revenue, params[:date]))
    else
      render json: ApiErrorSerializer.new(BusinessData::ApiError.new("No results found for that date", params[:date]))
    end
  end

  def show
    invoices = Merchant.find(params[:id]).invoices
    total_revenue = invoices.total_revenue_by_date(params[:date])
    if total_revenue
      render json: TotalRevenueForDateSerializer.new(BusinessData::TotalRevenueForDate.new(total_revenue, params[:date]))
    else
      render json: ApiErrorSerializer.new(BusinessData::ApiError.new("No results found for that date", params[:date]))
    end
  end
end
