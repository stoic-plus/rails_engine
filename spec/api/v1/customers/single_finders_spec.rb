require 'rails_helper'

describe 'Customer - Single Finders' do
  before :each do
    @c = create(:customer, first_name: 'Eric', last_name: 'Smith', created_at: "2012-03-21 14:54:09 UTC", updated_at: "2012-03-21 14:54:09 UTC")
    @c_2 = create(:customer, first_name: 'Jon', last_name: 'Son', created_at: "2012-03-18 14:54:09 UTC", updated_at: "2012-03-18 14:54:09 UTC")
  end
  it 'finds by id' do
    get "/api/v1/customers/find?id=#{@c.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer["attributes"]["id"]).to eq(@c.id)
    expect(customer["attributes"]["first_name"]).to eq(@c.first_name)
    expect(customer["attributes"]["last_name"]).to eq(@c.last_name)

    get "/api/v1/customers/find?id=#{@c_2.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer["attributes"]["id"]).to eq(@c_2.id)
    expect(customer["attributes"]["first_name"]).to eq(@c_2.first_name)
    expect(customer["attributes"]["last_name"]).to eq(@c_2.last_name)
  end
  it 'finds by first_name' do
    get "/api/v1/customers/find?first_name=#{@c.first_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer["attributes"]["id"]).to eq(@c.id)
    expect(customer["attributes"]["first_name"]).to eq(@c.first_name)
    expect(customer["attributes"]["last_name"]).to eq(@c.last_name)

    get "/api/v1/customers/find?first_name=#{@c_2.first_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer["attributes"]["id"]).to eq(@c_2.id)
    expect(customer["attributes"]["first_name"]).to eq(@c_2.first_name)
    expect(customer["attributes"]["last_name"]).to eq(@c_2.last_name)
  end
  it 'finds by last_name' do
    get "/api/v1/customers/find?last_name=#{@c.last_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer["attributes"]["id"]).to eq(@c.id)
    expect(customer["attributes"]["first_name"]).to eq(@c.first_name)
    expect(customer["attributes"]["last_name"]).to eq(@c.last_name)

    get "/api/v1/customers/find?last_name=#{@c_2.last_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer["attributes"]["id"]).to eq(@c_2.id)
    expect(customer["attributes"]["first_name"]).to eq(@c_2.first_name)
    expect(customer["attributes"]["last_name"]).to eq(@c_2.last_name)
  end
  it 'finds by created_at' do
    get "/api/v1/customers/find?created_at=#{@c.created_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer["attributes"]["id"]).to eq(@c.id)
    expect(customer["attributes"]["first_name"]).to eq(@c.first_name)
    expect(customer["attributes"]["last_name"]).to eq(@c.last_name)

    get "/api/v1/customers/find?created_at=#{@c_2.created_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer["attributes"]["id"]).to eq(@c_2.id)
    expect(customer["attributes"]["first_name"]).to eq(@c_2.first_name)
    expect(customer["attributes"]["last_name"]).to eq(@c_2.last_name)
  end
  it 'finds by updated_at' do
    get "/api/v1/customers/find?updated_at=#{@c.updated_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer["attributes"]["id"]).to eq(@c.id)
    expect(customer["attributes"]["first_name"]).to eq(@c.first_name)
    expect(customer["attributes"]["last_name"]).to eq(@c.last_name)

    get "/api/v1/customers/find?updated_at=#{@c_2.updated_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer["attributes"]["id"]).to eq(@c_2.id)
    expect(customer["attributes"]["first_name"]).to eq(@c_2.first_name)
    expect(customer["attributes"]["last_name"]).to eq(@c_2.last_name)
  end
  it 'returns error if no records found' do
    get "/api/v1/customers/find?last_name=leecurtis"

    expect(response).to be_successful

    error = JSON.parse(response.body)["data"]
    expect(error["type"]).to eq("api_error")
    expect(error["attributes"]["message"]).to eq("No records found with those params")
  end
end
