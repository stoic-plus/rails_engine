require 'rails_helper'

describe 'Invoice Item - Item Request' do
  it 'returns item for this invoice item' do
    c = create(:customer)
    m = create(:merchant)
    item = create(:item, merchant: m)

    invoice = create(:invoice, customer: c, merchant: m)
    inv_item = create(:invoice_item, item: item, invoice: invoice)

    get "/api/v1/invoice_items/#{inv_item.id}/item"

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json["attributes"]["id"]).to eq(item.id)
    expect(json["attributes"]["name"]).to eq(item.name)
    expect(json["attributes"]["description"]).to eq(item.description)
    expect(json["attributes"]["unit_price"]).to eq(item.unit_price)
    expect(json["attributes"]["merchant_id"]).to eq(item.merchant_id)
  end
end
