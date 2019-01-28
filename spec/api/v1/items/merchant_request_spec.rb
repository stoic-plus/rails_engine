require 'rails_helper'

describe 'Item - Merchant Request' do
  it 'returns merchant for this item' do
    m = create(:merchant)
    item = create(:item, merchant: m)

    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json["type"]).to eq("merchant")
    expect(json["attributes"]["id"]).to eq(m.id)
    expect(json["attributes"]["name"]).to eq(m.name)
  end
end
