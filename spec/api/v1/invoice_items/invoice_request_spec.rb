require 'rails_helper'

describe 'Invoice Item - Invoice Request' do
  it 'returns invoice for this invoice item' do
    c = create(:customer)
    m = create(:merchant)
    item = create(:item, merchant: m)

    invoice = create(:invoice, customer: c, merchant: m)
    inv_item = create(:invoice_item, item: item, invoice: invoice)

    get "/api/v1/invoice_items/#{inv_item.id}/invoice"

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json["type"]).to eq("invoice")
    expect(json["attributes"]["id"]).to eq(invoice.id)
    expect(json["attributes"]["customer_id"]).to eq(invoice.customer_id)
    expect(json["attributes"]["merchant_id"]).to eq(invoice.merchant_id)
    expect(json["attributes"]["status"]).to eq(invoice.status)
  end
end
