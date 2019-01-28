class Api::V1::Transactions::SearchController < ApplicationController
  def index
    transactions = Transaction.where(merchant_params)
    render_error if transactions.empty?
    render json: TransactionSerializer.new(transactions) unless transactions.empty?
  end

  def show
    transaction = Transaction.find_by(transaction_params)
    render_error unless transaction
    render json: TransactionSerializer.new(transaction) if transaction
  end

  private

  def transaction_params
    params.permit(:id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at)
  end

  def render_error
    render json: ApiErrorSerializer.new(BusinessData::ApiError.new("No records found with those params", DateTime.now))
  end
end
