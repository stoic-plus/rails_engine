require 'rails_helper'

describe 'Item - Invoice Items Request' do
  it 'returns invoice items for this item' do
    c = create(:customer)
    m = create(:merchant)
    item = create(:item, merchant: m)

    invoice = create(:invoice, customer: c, merchant: m)
    inv_i_1 = create(:invoice_item, item: item, invoice: invoice)
    inv_i_2 = create(:invoice_item, item: item, invoice: invoice)

    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json[0]["attributes"]["id"]).to eq(inv_i_1.id)
    expect(json[0]["attributes"]["item_id"]).to eq(inv_i_1.item_id)
    expect(json[0]["attributes"]["invoice_id"]).to eq(inv_i_1.invoice_id)
    expect(json[0]["attributes"]["quantity"]).to eq(inv_i_1.quantity)
    expect(json[0]["attributes"]["unit_price"]).to eq(inv_i_1.unit_price)

    expect(json[1]["attributes"]["id"]).to eq(inv_i_2.id)
    expect(json[1]["attributes"]["item_id"]).to eq(inv_i_2.item_id)
    expect(json[1]["attributes"]["invoice_id"]).to eq(inv_i_2.invoice_id)
    expect(json[1]["attributes"]["quantity"]).to eq(inv_i_2.quantity)
    expect(json[1]["attributes"]["unit_price"]).to eq(inv_i_2.unit_price)
  end
end
