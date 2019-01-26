require 'rails_helper'

describe 'Items - Most Revenue' do
  it 'returns a list of top items ranked by revenue' do
    c = create(:customer)
    m = create(:merchant)
    item_1 = create(:item, merchant: m)
    item_2 = create(:item, merchant: m)
    item_3 = create(:item, merchant: m)

    inv = create(:invoice, customer: c, merchant: m)
    ii_1 = create(:invoice_item, invoice: inv, item: item_1, quantity: 1, unit_price: 5)
    ii_2 = create(:invoice_item, invoice: inv, item: item_2, quantity: 1, unit_price: 10)
    ii_3 = create(:invoice_item, invoice: inv, item: item_3, quantity: 1, unit_price: 15)

    get '/api/v1/items/most_revenue?quantity=2'

    expect(response).to be_successful

    top_items_api = JSON.parse(response.body)["data"]
    expect(top_items_api.count).to eq(2)
    top_items = [item_3, item_2]

    top_items_api.each_with_index do |item, i|
      expect(top_items[i].id).to eq(item["attributes"]["id"])
      expect(top_items[i].name).to eq(item["attributes"]["name"])
      expect(top_items[i].name).to eq(item["attributes"]["description"])
      expect(top_items[i].name).to eq(item["attributes"]["unit_price"])
      expect(top_items[i].name).to eq(item["attributes"]["merchant_id"])
    end

    get '/api/v1/items/most_revenue?quantity=3'

    expect(response).to be_successful

    top_items_api = JSON.parse(response.body)["data"]
    expect(top_items_api.count).to eq(3)
    top_items = [item_3, item_2, item_1]

    top_items_api.each_with_index do |item, i|
      expect(top_items[i].id).to eq(item["attributes"]["id"])
      expect(top_items[i].name).to eq(item["attributes"]["name"])
      expect(top_items[i].name).to eq(item["attributes"]["description"])
      expect(top_items[i].name).to eq(item["attributes"]["unit_price"])
      expect(top_items[i].name).to eq(item["attributes"]["merchant_id"])
    end
  end
end
