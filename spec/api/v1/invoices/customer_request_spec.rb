require 'rails_helper'

describe 'Invoice - Customer Request' do
  it 'returns customer for this invoice' do
    c = create(:customer)
    m = create(:merchant)
    invoice = create(:invoice, customer: c, merchant: m)

    get "/api/v1/invoices/#{invoice.id}/customer"

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json["type"]).to eq("customer")
    expect(json["attributes"]["id"]).to eq(c.id)
    expect(json["attributes"]["first_name"]).to eq(c.first_name)
    expect(json["attributes"]["last_name"]).to eq(c.last_name)
  end
end
