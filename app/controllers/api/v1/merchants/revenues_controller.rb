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

    total_revenue = invoices.total_revenue_by_date(params[:date]) if params[:date]
    total_revenue = invoices.total_revenue unless params[:date]

    if total_revenue && params[:date]
      render json: TotalRevenueForDateSerializer.new(BusinessData::TotalRevenueForDate.new(total_revenue, params[:date]))
    elsif total_revenue
      render json: TotalRevenueSerializer.new(BusinessData::TotalRevenue.new(total_revenue))
    else
      render json: ApiErrorSerializer.new(BusinessData::ApiError.new("No results found for that date", params[:date]))
    end
  end
end
