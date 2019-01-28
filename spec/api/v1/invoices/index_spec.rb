require 'rails_helper'

describe 'Invoices - Index' do
  it 'returns all invoices' do
    m = create(:merchant)
    c = create(:customer)
    inv = create(:invoice, merchant: m, customer: c)
    inv_2 = create(:invoice, merchant: m, customer: c)

    get '/api/v1/invoices.json'

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json[0]["attributes"]["id"]).to eq(inv.id)
    expect(json[0]["attributes"]["customer_id"]).to eq(inv.customer_id)
    expect(json[0]["attributes"]["merchant_id"]).to eq(inv.merchant_id)
    expect(json[0]["attributes"]["status"]).to eq(inv.status)

    expect(json[1]["attributes"]["id"]).to eq(inv_2.id)
    expect(json[1]["attributes"]["customer_id"]).to eq(inv_2.customer_id)
    expect(json[1]["attributes"]["merchant_id"]).to eq(inv_2.merchant_id)
    expect(json[1]["attributes"]["status"]).to eq(inv_2.status)
  end
end
