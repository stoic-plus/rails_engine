class Api::V1::Invoices::CustomerController < ApplicationController
  def index
    invoice = Invoice.find(params[:id])
    render json: CustomerSerializer.new(invoice.customer)
  end
end
