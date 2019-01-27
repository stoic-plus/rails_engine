class Api::V1::Customers::SearchController < ApplicationController
  def index
    customers = Customer.where(customer_params)
    render_error if customers.empty?
    render json: CustomerSerializer.new(customers) unless customers.empty?
  end

  def show
    customer = Customer.find_by(customer_params)
    render_error unless customer
    render json: CustomerSerializer.new(customer) if customer
  end

  private

  def customer_params
    params.permit(:id, :first_name, :last_name, :created_at, :updated_at)
  end

  def render_error
    render json: ApiErrorSerializer.new(BusinessData::ApiError.new("No records found with those params", DateTime.now))
  end
end
