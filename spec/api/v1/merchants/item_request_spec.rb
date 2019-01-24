require 'rails_helper'

describe 'Merchant - Items Request' do
  it 'sends a list of items for this merchant' do
    m = create(:merchant)
    item_1 = create(:item, merchant: m)
    item_2 = create(:item, merchant: m)
    item_3 = create(:item, merchant: m)

    m_1 = create(:merchant)
    item_4 = create(:item, merchant: m_1)
    item_5 = create(:item, merchant: m_1)
    item_6 = create(:item, merchant: m_1)

    get "/api/v1/merchants/#{m.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)["data"]
    expect(items.count).to eq(3)
    m.items.each_with_index do |item, i|
      expect(items[i]["attributes"]["id"]).to eq(item.id)
      expect(items[i]["attributes"]["name"]).to eq(item.name)
      expect(items[i]["attributes"]["description"]).to eq(item.description)
      expect(items[i]["attributes"]["unit_price"]).to eq(item.unit_price)
      expect(items[i]["attributes"]["merchant_id"]).to eq(item.merchant_id)
    end
  end
end
