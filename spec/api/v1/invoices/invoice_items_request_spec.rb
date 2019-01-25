require 'rails_helper'

describe 'Invoice - Invoice_Items Request' do
  it 'returns a list of invoice items for this invoice' do
    c = create(:customer)
    m = create(:merchant)
    item = create(:item, merchant: m)

    invoice = create(:invoice, customer: c, merchant: m)
    create(:invoice_item, item: item, invoice: invoice)
    create(:invoice_item, item: item, invoice: invoice)
    create(:invoice_item, item: item, invoice: invoice)


    invoice_2 = create(:invoice, customer: c, merchant: m)
    create(:invoice_item, item: item, invoice: invoice_2)
    create(:invoice_item, item: item, invoice: invoice_2)
    create(:invoice_item, item: item, invoice: invoice_2)
    create(:invoice_item, item: item, invoice: invoice_2)

    get "/api/v1/invoices/#{invoice_2.id}/invoice_items"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)["data"]
    expect(invoice_items.count).to eq(4)
    invoice_2.invoice_items.each_with_index do |inv_i, i|
      expect(invoice_items[i]["attributes"]["id"]).to eq(inv_i.id)
      expect(invoice_items[i]["attributes"]["item_id"]).to eq(inv_i.item_id)
      expect(invoice_items[i]["attributes"]["invoice_id"]).to eq(inv_i.invoice_id)
      expect(invoice_items[i]["attributes"]["quantity"]).to eq(inv_i.quantity)
      expect(invoice_items[i]["attributes"]["unit_price"]).to eq(inv_i.unit_price)
    end
  end
end
