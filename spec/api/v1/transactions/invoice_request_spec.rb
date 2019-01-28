require 'rails_helper'

describe 'Transaction - Invoice Request' do
  it 'returns invoice for this transaction' do
    c = create(:customer)
    m = create(:merchant)
    invoice = create(:invoice, customer: c, merchant: m)
    transaction = create(:transaction, invoice: invoice)

    get "/api/v1/transactions/#{transaction.id}/invoice"

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json["type"]).to eq("invoice")
    expect(json["attributes"]["id"]).to eq(invoice.id)
    expect(json["attributes"]["customer_id"]).to eq(invoice.customer_id)
    expect(json["attributes"]["merchant_id"]).to eq(invoice.merchant_id)
    expect(json["attributes"]["status"]).to eq(invoice.status)
  end
end
