require 'rails_helper'

describe 'Customers - Invoice Request' do
  it 'returns invoices for this customer' do
    c = create(:customer)
    m = create(:merchant)

    invoice = create(:invoice, customer: c, merchant: m)
    invoice_2 = create(:invoice, customer: c, merchant: m)

    get "/api/v1/customers/#{c.id}/invoices"

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json[0]["type"]).to eq("invoice")
    expect(json[0]["attributes"]["id"]).to eq(invoice.id)
    expect(json[0]["attributes"]["customer_id"]).to eq(invoice.customer_id)
    expect(json[0]["attributes"]["merchant_id"]).to eq(invoice.merchant_id)
    expect(json[0]["attributes"]["status"]).to eq(invoice.status)

    expect(json[1]["attributes"]["id"]).to eq(invoice_2.id)
    expect(json[1]["attributes"]["customer_id"]).to eq(invoice_2.customer_id)
    expect(json[1]["attributes"]["merchant_id"]).to eq(invoice_2.merchant_id)
    expect(json[1]["attributes"]["status"]).to eq(invoice_2.status)
  end
end
