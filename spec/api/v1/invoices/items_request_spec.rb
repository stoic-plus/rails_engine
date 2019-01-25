require 'rails_helper'

describe 'Invoice - Items Request' do
  it 'returns a list of items for this invoice' do
    c = create(:customer)
    m = create(:merchant)
    it_1 = create(:item, merchant: m)
    it_2 = create(:item, merchant: m)
    it_3 = create(:item, merchant: m)
    it_4 = create(:item, merchant: m)
    it_5 = create(:item, merchant: m)
    it_6 = create(:item, merchant: m)

    invoice = create(:invoice, customer: c, merchant: m)
    create(:invoice_item, item: it_1, invoice: invoice)
    create(:invoice_item, item: it_2, invoice: invoice)
    create(:invoice_item, item: it_3, invoice: invoice)


    invoice_2 = create(:invoice, customer: c, merchant: m)
    create(:invoice_item, item: it_4, invoice: invoice_2)
    create(:invoice_item, item: it_5, invoice: invoice_2)
    create(:invoice_item, item: it_6, invoice: invoice_2)

    get "/api/v1/invoices/#{invoice_2.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)["data"]
    expect(items.count).to eq(3)
    invoice_2.items.each_with_index do |item, i|
      expect(items[i]["attributes"]["id"]).to eq(item.id)
      expect(items[i]["attributes"]["name"]).to eq(item.name)
      expect(items[i]["attributes"]["description"]).to eq(item.description)
      expect(items[i]["attributes"]["unit_price"]).to eq(item.unit_price)
      expect(items[i]["attributes"]["merchant_id"]).to eq(item.merchant_id)
    end
  end
end
