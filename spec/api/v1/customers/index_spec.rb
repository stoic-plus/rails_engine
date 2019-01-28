require 'rails_helper'

describe 'Customers - Index' do
  it 'returns all customers' do
    c = create(:customer)
    c_2 = create(:customer)

    get '/api/v1/customers.json'

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json[0]["attributes"]["id"]).to eq(c.id)
    expect(json[0]["attributes"]["first_name"]).to eq(c.first_name)
    expect(json[0]["attributes"]["last_name"]).to eq(c.last_name)

    expect(json[1]["attributes"]["id"]).to eq(c_2.id)
    expect(json[1]["attributes"]["first_name"]).to eq(c_2.first_name)
    expect(json[1]["attributes"]["last_name"]).to eq(c_2.last_name)
  end
end
