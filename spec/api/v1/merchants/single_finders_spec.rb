require 'rails_helper'

describe 'Merchant - Single Finders' do
  before :each do
    @m = create(:merchant, name: 'Jon', created_at: 1.days.ago, updated_at: 2.days.ago)
    @m_2 = create(:merchant, name: 'Eric', created_at: 2.days.ago, updated_at: 3.days.ago)
  end
  it 'finds by id' do
    get "/api/v1/merchants/find?id=#{@m.id}"

    expect(response).to be_successful

    merch = JSON.parse(response.body)["data"]
    expect(merch["attributes"]["id"]).to eq(@m.id)
    expect(merch["attributes"]["name"]).to eq(@m.name)

    get "/api/v1/merchants/find?id=#{@m_2.id}"

    expect(response).to be_successful

    merch = JSON.parse(response.body)["data"]
    expect(merch["attributes"]["id"]).to eq(@m_2.id)
    expect(merch["attributes"]["name"]).to eq(@m_2.name)
  end
  it 'finds by name' do
    get "/api/v1/merchants/find?name=#{@m.name}"

    expect(response).to be_successful

    merch = JSON.parse(response.body)["data"]
    expect(merch["attributes"]["id"]).to eq(@m.id)
    expect(merch["attributes"]["name"]).to eq(@m.name)

    get "/api/v1/merchants/find?name=#{@m_2.name}"

    expect(response).to be_successful

    merch = JSON.parse(response.body)["data"]
    expect(merch["attributes"]["id"]).to eq(@m_2.id)
    expect(merch["attributes"]["name"]).to eq(@m_2.name)
  end

  it 'finds by created_at' do
    get "/api/v1/merchants/find?created_at=#{@m.created_at}"

    expect(response).to be_successful

    merch = JSON.parse(response.body)["data"]
    expect(merch["attributes"]["id"]).to eq(@m.id)
    expect(merch["attributes"]["name"]).to eq(@m.name)

    get "/api/v1/merchants/find?created_at=#{@m_2.created_at}"

    expect(response).to be_successful

    merch = JSON.parse(response.body)["data"]
    expect(merch["attributes"]["id"]).to eq(@m_2.id)
    expect(merch["attributes"]["name"]).to eq(@m_2.name)
  end
  it 'finds by updated_at' do
    get "/api/v1/merchants/find?updated_at=#{@m.updated_at}"

    expect(response).to be_successful

    merch = JSON.parse(response.body)["data"]
    expect(merch["attributes"]["id"]).to eq(@m.id)
    expect(merch["attributes"]["name"]).to eq(@m.name)

    get "/api/v1/merchants/find?updated_at=#{@m_2.updated_at}"

    expect(response).to be_successful

    merch = JSON.parse(response.body)["data"]
    expect(merch["attributes"]["id"]).to eq(@m_2.id)
    expect(merch["attributes"]["name"]).to eq(@m_2.name)
  end
end
