require 'rails_helper'

describe 'Merchants - All finders' do
  before :each do
    @m = create(:merchant, name: 'Jon', created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")
    @m_a = create(:merchant, name: 'Jon')

    @m_2 = create(:merchant, name: 'Eric', created_at: "2012-03-21 14:54:09 UTC", updated_at: "2012-03-21 14:54:09 UTC")
    @m_2_a = create(:merchant, name: 'Bethooven', created_at: "2012-03-21 14:54:09 UTC", updated_at: "2012-03-21 14:54:09 UTC")
  end
  it 'finds all by id' do
    get "/api/v1/merchants/find_all?id=#{@m.id}"

    expect(response).to be_successful

    merch = JSON.parse(response.body)["data"]
    expect(merch[0]["attributes"]["id"]).to eq(@m.id)
    expect(merch[0]["attributes"]["name"]).to eq(@m.name)

    get "/api/v1/merchants/find_all?id=#{@m_2.id}"

    expect(response).to be_successful

    merch = JSON.parse(response.body)["data"]
    expect(merch[0]["attributes"]["id"]).to eq(@m_2.id)
    expect(merch[0]["attributes"]["name"]).to eq(@m_2.name)
  end
  it 'finds all by name' do
    get "/api/v1/merchants/find_all?name=#{@m.name}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)["data"]
    expect(merchants[0]["attributes"]["id"]).to eq(@m.id)
    expect(merchants[0]["attributes"]["name"]).to eq(@m.name)
    expect(merchants[1]["attributes"]["id"]).to eq(@m_a.id)
    expect(merchants[1]["attributes"]["name"]).to eq(@m_a.name)
  end

  it 'finds all by created_at' do
    get "/api/v1/merchants/find_all?created_at=#{@m_2.created_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)["data"]
    expect(merchants[0]["attributes"]["id"]).to eq(@m_2.id)
    expect(merchants[0]["attributes"]["name"]).to eq(@m_2.name)
    expect(merchants[1]["attributes"]["id"]).to eq(@m_2_a.id)
    expect(merchants[1]["attributes"]["name"]).to eq(@m_2_a.name)
  end
  it 'finds all by updated_at' do
    get "/api/v1/merchants/find_all?updated_at=#{@m_2.updated_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)["data"]
    expect(merchants[0]["attributes"]["id"]).to eq(@m_2.id)
    expect(merchants[0]["attributes"]["name"]).to eq(@m_2.name)
    expect(merchants[1]["attributes"]["id"]).to eq(@m_2_a.id)
    expect(merchants[1]["attributes"]["name"]).to eq(@m_2_a.name)
  end
  it 'returns error if no records found' do
    get "/api/v1/merchants/find_all?updated_at=2009-03-21 14:54:09 UTC"

    expect(response).to be_successful

    error = JSON.parse(response.body)["data"]
    expect(error["type"]).to eq("api_error")
    expect(error["attributes"]["message"]).to eq("No records found with those params")
  end
end
