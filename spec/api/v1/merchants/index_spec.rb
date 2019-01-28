require 'rails_helper'

describe 'Merchants - Index' do
  it 'returns all merchants' do
    m = create(:merchant, name: 'Jon', created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")
    m_2 = create(:merchant, name: 'Eric', created_at: "2012-03-21 14:54:09 UTC", updated_at: "2012-03-21 14:54:09 UTC")

    get '/api/v1/merchants.json'

    expect(response).to be_successful

    merch = JSON.parse(response.body)["data"]
    expect(merch[0]["attributes"]["id"]).to eq(m.id)
    expect(merch[0]["attributes"]["name"]).to eq(m.name)

    expect(merch[1]["attributes"]["id"]).to eq(m_2.id)
    expect(merch[1]["attributes"]["name"]).to eq(m_2.name)
  end
end
