require 'rails_helper'

describe 'Customer - All Finders' do
  before :each do
    @c = create(:customer, first_name: 'Eric', last_name: 'Smith', created_at: "2012-03-21 14:54:09 UTC", updated_at: "2012-03-21 14:54:09 UTC")
    @c_a = create(:customer, first_name: 'Eric', last_name: 'Smith', created_at: "2012-03-21 14:54:09 UTC", updated_at: "2012-03-21 14:54:09 UTC")

    @c_2 = create(:customer, first_name: 'Jon', last_name: 'Son', created_at: "2012-03-18 14:54:09 UTC", updated_at: "2012-03-18 14:54:09 UTC")
  end
  it 'finds all by id' do
    get "/api/v1/customers/find_all?id=#{@c.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer[0]["attributes"]["id"]).to eq(@c.id)
    expect(customer[0]["attributes"]["first_name"]).to eq(@c.first_name)
    expect(customer[0]["attributes"]["last_name"]).to eq(@c.last_name)

    get "/api/v1/customers/find_all?id=#{@c_2.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer[0]["attributes"]["id"]).to eq(@c_2.id)
    expect(customer[0]["attributes"]["first_name"]).to eq(@c_2.first_name)
    expect(customer[0]["attributes"]["last_name"]).to eq(@c_2.last_name)
  end
  it 'finds all by first_name' do
    get "/api/v1/customers/find_all?first_name=#{@c.first_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer[0]["attributes"]["id"]).to eq(@c.id)
    expect(customer[0]["attributes"]["first_name"]).to eq(@c.first_name)
    expect(customer[0]["attributes"]["last_name"]).to eq(@c.last_name)

    expect(customer[1]["attributes"]["id"]).to eq(@c_a.id)
    expect(customer[1]["attributes"]["first_name"]).to eq(@c_a.first_name)
    expect(customer[1]["attributes"]["last_name"]).to eq(@c_a.last_name)
  end
  it 'finds all by last_name' do
    get "/api/v1/customers/find_all?last_name=#{@c.last_name}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer[0]["attributes"]["id"]).to eq(@c.id)
    expect(customer[0]["attributes"]["first_name"]).to eq(@c.first_name)
    expect(customer[0]["attributes"]["last_name"]).to eq(@c.last_name)

    expect(customer[1]["attributes"]["id"]).to eq(@c_a.id)
    expect(customer[1]["attributes"]["first_name"]).to eq(@c_a.first_name)
    expect(customer[1]["attributes"]["last_name"]).to eq(@c_a.last_name)
  end
  it 'finds all by created_at' do
    get "/api/v1/customers/find_all?created_at=#{@c.created_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer[0]["attributes"]["id"]).to eq(@c.id)
    expect(customer[0]["attributes"]["first_name"]).to eq(@c.first_name)
    expect(customer[0]["attributes"]["last_name"]).to eq(@c.last_name)

    expect(customer[1]["attributes"]["id"]).to eq(@c_a.id)
    expect(customer[1]["attributes"]["first_name"]).to eq(@c_a.first_name)
    expect(customer[1]["attributes"]["last_name"]).to eq(@c_a.last_name)
  end
  it 'finds all by updated_at' do
    get "/api/v1/customers/find_all?updated_at=#{@c.updated_at}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)["data"]
    expect(customer[0]["attributes"]["id"]).to eq(@c.id)
    expect(customer[0]["attributes"]["first_name"]).to eq(@c.first_name)
    expect(customer[0]["attributes"]["last_name"]).to eq(@c.last_name)

    expect(customer[1]["attributes"]["id"]).to eq(@c_a.id)
    expect(customer[1]["attributes"]["first_name"]).to eq(@c_a.first_name)
    expect(customer[1]["attributes"]["last_name"]).to eq(@c_a.last_name)
  end
  it 'returns error if no records found' do
    get "/api/v1/customers/find_all?last_name=leecurtis"

    expect(response).to be_successful

    error = JSON.parse(response.body)["data"]
    expect(error["type"]).to eq("api_error")
    expect(error["attributes"]["message"]).to eq("No records found with those params")
  end
end
