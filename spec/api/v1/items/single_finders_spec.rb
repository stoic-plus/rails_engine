require 'rails_helper'

describe 'Item - Single Finders' do
  before :each do
    m = create(:merchant)
    m_2 = create(:merchant)

    @item = create(:item, merchant: m, unit_price: 20, created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")
    @item_2 = create(:item, merchant: m_2, created_at: "2012-03-21 14:54:09 UTC", updated_at: "2012-03-21 14:54:09 UTC")
  end
  it 'finds by id' do
    get "/api/v1/items/find?id=#{@item.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item["attributes"]["id"]).to eq(@item.id)
    expect(item["attributes"]["name"]).to eq(@item.name)
    expect(item["attributes"]["description"]).to eq(@item.description)
    expect(item["attributes"]["unit_price"]).to eq(@item.unit_price)
    expect(item["attributes"]["merchant_id"]).to eq(@item.merchant_id)

    get "/api/v1/items/find?id=#{@item_2.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item["attributes"]["id"]).to eq(@item_2.id)
    expect(item["attributes"]["name"]).to eq(@item_2.name)
    expect(item["attributes"]["description"]).to eq(@item_2.description)
    expect(item["attributes"]["unit_price"]).to eq(@item_2.unit_price)
    expect(item["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
  end
  it 'finds by name' do
    get "/api/v1/items/find?name=#{@item.name}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item["attributes"]["id"]).to eq(@item.id)
    expect(item["attributes"]["name"]).to eq(@item.name)
    expect(item["attributes"]["description"]).to eq(@item.description)
    expect(item["attributes"]["unit_price"]).to eq(@item.unit_price)
    expect(item["attributes"]["merchant_id"]).to eq(@item.merchant_id)

    get "/api/v1/items/find?name=#{@item_2.name}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item["attributes"]["id"]).to eq(@item_2.id)
    expect(item["attributes"]["name"]).to eq(@item_2.name)
    expect(item["attributes"]["description"]).to eq(@item_2.description)
    expect(item["attributes"]["unit_price"]).to eq(@item_2.unit_price)
    expect(item["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
  end
  it 'finds by description' do
    get "/api/v1/items/find?description=#{@item.description}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item["attributes"]["id"]).to eq(@item.id)
    expect(item["attributes"]["name"]).to eq(@item.name)
    expect(item["attributes"]["description"]).to eq(@item.description)
    expect(item["attributes"]["unit_price"]).to eq(@item.unit_price)
    expect(item["attributes"]["merchant_id"]).to eq(@item.merchant_id)

    get "/api/v1/items/find?description=#{@item_2.description}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item["attributes"]["id"]).to eq(@item_2.id)
    expect(item["attributes"]["name"]).to eq(@item_2.name)
    expect(item["attributes"]["description"]).to eq(@item_2.description)
    expect(item["attributes"]["unit_price"]).to eq(@item_2.unit_price)
    expect(item["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
  end
  it 'finds by unit_price' do
    get "/api/v1/items/find?unit_price=#{@item.unit_price}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item["attributes"]["id"]).to eq(@item.id)
    expect(item["attributes"]["name"]).to eq(@item.name)
    expect(item["attributes"]["description"]).to eq(@item.description)
    expect(item["attributes"]["unit_price"]).to eq(@item.unit_price)
    expect(item["attributes"]["merchant_id"]).to eq(@item.merchant_id)

    get "/api/v1/items/find?unit_price=#{@item_2.unit_price}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item["attributes"]["id"]).to eq(@item_2.id)
    expect(item["attributes"]["name"]).to eq(@item_2.name)
    expect(item["attributes"]["description"]).to eq(@item_2.description)
    expect(item["attributes"]["unit_price"]).to eq(@item_2.unit_price)
    expect(item["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
  end
  it 'finds by created_at' do
    get "/api/v1/items/find?created_at=#{@item.created_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item["attributes"]["id"]).to eq(@item.id)
    expect(item["attributes"]["name"]).to eq(@item.name)
    expect(item["attributes"]["description"]).to eq(@item.description)
    expect(item["attributes"]["unit_price"]).to eq(@item.unit_price)
    expect(item["attributes"]["merchant_id"]).to eq(@item.merchant_id)

    get "/api/v1/items/find?created_at=#{@item_2.created_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item["attributes"]["id"]).to eq(@item_2.id)
    expect(item["attributes"]["name"]).to eq(@item_2.name)
    expect(item["attributes"]["description"]).to eq(@item_2.description)
    expect(item["attributes"]["unit_price"]).to eq(@item_2.unit_price)
    expect(item["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
  end
  it 'finds by updated_at' do
    get "/api/v1/items/find?updated_at=#{@item.updated_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item["attributes"]["id"]).to eq(@item.id)
    expect(item["attributes"]["name"]).to eq(@item.name)
    expect(item["attributes"]["description"]).to eq(@item.description)
    expect(item["attributes"]["unit_price"]).to eq(@item.unit_price)
    expect(item["attributes"]["merchant_id"]).to eq(@item.merchant_id)

    get "/api/v1/items/find?updated_at=#{@item_2.updated_at}"

    expect(response).to be_successful

    item = JSON.parse(response.body)["data"]
    expect(item["attributes"]["id"]).to eq(@item_2.id)
    expect(item["attributes"]["name"]).to eq(@item_2.name)
    expect(item["attributes"]["description"]).to eq(@item_2.description)
    expect(item["attributes"]["unit_price"]).to eq(@item_2.unit_price)
    expect(item["attributes"]["merchant_id"]).to eq(@item_2.merchant_id)
  end
  it 'returns error if no records found' do
    get "/api/v1/items/find?name=plumbus"

    expect(response).to be_successful

    error = JSON.parse(response.body)["data"]
    expect(error["type"]).to eq("api_error")
    expect(error["attributes"]["message"]).to eq("No records found with those params")
  end
end
