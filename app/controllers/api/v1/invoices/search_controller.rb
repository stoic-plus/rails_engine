class Api::V1::Invoices::SearchController < ApplicationController
  def index
    invoices = Invoice.where(invoice_params)
    render_error if invoices.empty?
    render json: InvoiceSerializer.new(invoices) unless invoices.empty?
  end

  def show
    invoice = Invoice.find_by(invoice_params)
    render_error unless invoice
    render json: InvoiceSerializer.new(invoice) if invoice
  end

  private

  def invoice_params
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end

  def render_error
    render json: ApiErrorSerializer.new(BusinessData::ApiError.new("No records found with those params", DateTime.now))
  end
end
