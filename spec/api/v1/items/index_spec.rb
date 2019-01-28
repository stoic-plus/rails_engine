require 'rails_helper'

describe 'Items - Index' do
  it 'returns all items' do
    m = create(:merchant)
    item = create(:item, merchant: m)
    item_2 = create(:item, merchant: m)

    get '/api/v1/items.json'

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json[0]["attributes"]["id"]).to eq(item.id)
    expect(json[0]["attributes"]["name"]).to eq(item.name)
    expect(json[0]["attributes"]["description"]).to eq(item.description)
    expect(json[0]["attributes"]["unit_price"]).to eq(item.unit_price)
    expect(json[0]["attributes"]["merchant_id"]).to eq(item.merchant_id)

    expect(json[1]["attributes"]["id"]).to eq(item_2.id)
    expect(json[1]["attributes"]["name"]).to eq(item_2.name)
    expect(json[1]["attributes"]["description"]).to eq(item_2.description)
    expect(json[1]["attributes"]["unit_price"]).to eq(item_2.unit_price)
    expect(json[1]["attributes"]["merchant_id"]).to eq(item_2.merchant_id)
  end
end
