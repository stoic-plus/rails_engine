require 'rails_helper'

describe 'Item - All Finders' do
  before :each do
    m = create(:merchant)
    m_2 = create(:merchant)

    @item = create(:item, name: 'plumbus', description: 'regular old plumbus', merchant: m, unit_price: 20, created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")
    @item_a = create(:item, name: 'plumbus', description: 'regular old plumbus', merchant: m, unit_price: 20, created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")

    @item_2 = create(:item, merchant: m_2, created_at: "2012-03-21 14:54:09 UTC", updated_at: "2012-03-21 14:54:09 UTC")
  end
  it 'finds all by id' do
    get "/api/v1/items/find_all?id=#{@item.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item[0]["attributes"]["id"]).to eq(@item.id)
    expect(item[0]["attributes"]["name"]).to eq(@item.name)
    expect(item[0]["attributes"]["description"]).to eq(@item.description)
    expect(item[0]["attributes"]["unit_price"]).to eq(@item.unit_price)
    expect(item[0]["attributes"]["merchant_id"]).to eq(@item.merchant_id)

    get "/api/v1/items/find_all?id=#{@item_2.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item[0]["attributes"]["id"]).to eq(@item_2.id)
    expect(item[0]["attributes"]["name"]).to eq(@item_2.name)
    expect(item[0]["attributes"]["description"]).to eq(@item_2.description)
    expect(item[0]["attributes"]["unit_price"]).to eq(@item_2.unit_price)
    expect(item[0]["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
  end
  it 'finds all by name' do
    get "/api/v1/items/find_all?name=#{@item.name}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item[0]["attributes"]["id"]).to eq(@item.id)
    expect(item[0]["attributes"]["name"]).to eq(@item.name)
    expect(item[0]["attributes"]["description"]).to eq(@item.description)
    expect(item[0]["attributes"]["unit_price"]).to eq(@item.unit_price)
    expect(item[0]["attributes"]["merchant_id"]).to eq(@item.merchant_id)

    expect(item[1]["attributes"]["id"]).to eq(@item_a.id)
    expect(item[1]["attributes"]["name"]).to eq(@item_a.name)
    expect(item[1]["attributes"]["description"]).to eq(@item_a.description)
    expect(item[1]["attributes"]["unit_price"]).to eq(@item_a.unit_price)
    expect(item[1]["attributes"]["merchant_id"]).to eq(@item_a.merchant_id)
  end
  it 'finds all by description' do
    get "/api/v1/items/find_all?description=#{@item.description}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item[0]["attributes"]["id"]).to eq(@item.id)
    expect(item[0]["attributes"]["name"]).to eq(@item.name)
    expect(item[0]["attributes"]["description"]).to eq(@item.description)
    expect(item[0]["attributes"]["unit_price"]).to eq(@item.unit_price)
    expect(item[0]["attributes"]["merchant_id"]).to eq(@item.merchant_id)

    expect(item[1]["attributes"]["id"]).to eq(@item_a.id)
    expect(item[1]["attributes"]["name"]).to eq(@item_a.name)
    expect(item[1]["attributes"]["description"]).to eq(@item_a.description)
    expect(item[1]["attributes"]["unit_price"]).to eq(@item_a.unit_price)
    expect(item[1]["attributes"]["merchant_id"]).to eq(@item_a.merchant_id)
  end
  it 'finds all by unit_price' do
    get "/api/v1/items/find_all?unit_price=#{@item.unit_price}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item[0]["attributes"]["id"]).to eq(@item.id)
    expect(item[0]["attributes"]["name"]).to eq(@item.name)
    expect(item[0]["attributes"]["description"]).to eq(@item.description)
    expect(item[0]["attributes"]["unit_price"]).to eq(@item.unit_price)
    expect(item[0]["attributes"]["merchant_id"]).to eq(@item.merchant_id)

    expect(item[1]["attributes"]["id"]).to eq(@item_a.id)
    expect(item[1]["attributes"]["name"]).to eq(@item_a.name)
    expect(item[1]["attributes"]["description"]).to eq(@item_a.description)
    expect(item[1]["attributes"]["unit_price"]).to eq(@item_a.unit_price)
    expect(item[1]["attributes"]["merchant_id"]).to eq(@item_a.merchant_id)
  end
  it 'finds all by created_at' do
    get "/api/v1/items/find_all?created_at=#{@item.created_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item[0]["attributes"]["id"]).to eq(@item.id)
    expect(item[0]["attributes"]["name"]).to eq(@item.name)
    expect(item[0]["attributes"]["description"]).to eq(@item.description)
    expect(item[0]["attributes"]["unit_price"]).to eq(@item.unit_price)
    expect(item[0]["attributes"]["merchant_id"]).to eq(@item.merchant_id)

    expect(item[1]["attributes"]["id"]).to eq(@item_a.id)
    expect(item[1]["attributes"]["name"]).to eq(@item_a.name)
    expect(item[1]["attributes"]["description"]).to eq(@item_a.description)
    expect(item[1]["attributes"]["unit_price"]).to eq(@item_a.unit_price)
    expect(item[1]["attributes"]["merchant_id"]).to eq(@item_a.merchant_id)
  end
  it 'finds all by updated_at' do
    get "/api/v1/items/find_all?updated_at=#{@item.updated_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item[0]["attributes"]["id"]).to eq(@item.id)
    expect(item[0]["attributes"]["name"]).to eq(@item.name)
    expect(item[0]["attributes"]["description"]).to eq(@item.description)
    expect(item[0]["attributes"]["unit_price"]).to eq(@item.unit_price)
    expect(item[0]["attributes"]["merchant_id"]).to eq(@item.merchant_id)

    expect(item[1]["attributes"]["id"]).to eq(@item_a.id)
    expect(item[1]["attributes"]["name"]).to eq(@item_a.name)
    expect(item[1]["attributes"]["description"]).to eq(@item_a.description)
    expect(item[1]["attributes"]["unit_price"]).to eq(@item_a.unit_price)
    expect(item[1]["attributes"]["merchant_id"]).to eq(@item_a.merchant_id)
  end
  it 'returns error if no records found' do
    get "/api/v1/items/find?name=fleeblejuice"

    expect(response).to be_successful

    error = JSON.parse(response.body)["data"]
    expect(error["type"]).to eq("api_error")
    expect(error["attributes"]["message"]).to eq("No records found with those params")
  end
end
