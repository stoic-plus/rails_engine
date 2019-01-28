require 'rails_helper'

describe 'Invoice - Customer Request' do
  it 'returns customer for this invoice' do
    c = create(:customer)
    m = create(:merchant)
    invoice = create(:invoice, customer: c, merchant: m)

    get "/api/v1/invoices/#{invoice.id}/merchant"

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json["type"]).to eq("merchant")
    expect(json["attributes"]["id"]).to eq(m.id)
    expect(json["attributes"]["name"]).to eq(m.name)
  end
end
