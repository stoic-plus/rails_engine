require 'rails_helper'

describe 'Invoice - Single Finders' do
  before :each do
    c = create(:customer)
    c_2 = create(:customer)
    m = create(:merchant)
    m_2 = create(:merchant)

    @inv = create(:invoice, customer: c, merchant: m, status: 'pending', created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")
    @inv_2 = create(:invoice, customer: c_2, merchant: m_2, created_at: "2012-03-21 14:54:09 UTC", updated_at: "2012-03-21 14:54:09 UTC")
  end
  it 'finds by id' do
    get "/api/v1/invoices/find?id=#{@inv.id}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv["attributes"]["id"]).to eq(@inv.id)
    expect(inv["attributes"]["customer_id"]).to eq(@inv.customer_id)
    expect(inv["attributes"]["merchant_id"]).to eq(@inv.merchant_id)
    expect(inv["attributes"]["status"]).to eq(@inv.status)

    get "/api/v1/invoices/find?id=#{@inv_2.id}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv["attributes"]["id"]).to eq(@inv_2.id)
    expect(inv["attributes"]["customer_id"]).to eq(@inv_2.customer_id)
    expect(inv["attributes"]["merchant_id"]).to eq(@inv_2.merchant_id)
    expect(inv["attributes"]["status"]).to eq(@inv_2.status)
  end
  it 'finds by customer_id' do
    get "/api/v1/invoices/find?customer_id=#{@inv.customer_id}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv["attributes"]["id"]).to eq(@inv.id)
    expect(inv["attributes"]["customer_id"]).to eq(@inv.customer_id)
    expect(inv["attributes"]["merchant_id"]).to eq(@inv.merchant_id)
    expect(inv["attributes"]["status"]).to eq(@inv.status)

    get "/api/v1/invoices/find?customer_id=#{@inv_2.customer_id}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv["attributes"]["id"]).to eq(@inv_2.id)
    expect(inv["attributes"]["customer_id"]).to eq(@inv_2.customer_id)
    expect(inv["attributes"]["merchant_id"]).to eq(@inv_2.merchant_id)
    expect(inv["attributes"]["status"]).to eq(@inv_2.status)
  end
  it 'finds by merchant_id' do
    get "/api/v1/invoices/find?merchant_id=#{@inv.merchant_id}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv["attributes"]["id"]).to eq(@inv.id)
    expect(inv["attributes"]["customer_id"]).to eq(@inv.customer_id)
    expect(inv["attributes"]["merchant_id"]).to eq(@inv.merchant_id)
    expect(inv["attributes"]["status"]).to eq(@inv.status)

    get "/api/v1/invoices/find?merchant_id=#{@inv_2.merchant_id}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv["attributes"]["id"]).to eq(@inv_2.id)
    expect(inv["attributes"]["customer_id"]).to eq(@inv_2.customer_id)
    expect(inv["attributes"]["merchant_id"]).to eq(@inv_2.merchant_id)
    expect(inv["attributes"]["status"]).to eq(@inv_2.status)
  end
  it 'finds by status' do
    get "/api/v1/invoices/find?status=#{@inv.status}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv["attributes"]["id"]).to eq(@inv.id)
    expect(inv["attributes"]["customer_id"]).to eq(@inv.customer_id)
    expect(inv["attributes"]["merchant_id"]).to eq(@inv.merchant_id)
    expect(inv["attributes"]["status"]).to eq(@inv.status)

    get "/api/v1/invoices/find?status=#{@inv_2.status}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv["attributes"]["id"]).to eq(@inv_2.id)
    expect(inv["attributes"]["customer_id"]).to eq(@inv_2.customer_id)
    expect(inv["attributes"]["merchant_id"]).to eq(@inv_2.merchant_id)
    expect(inv["attributes"]["status"]).to eq(@inv_2.status)
  end
  it 'finds by created_at' do
    get "/api/v1/invoices/find?created_at=#{@inv.created_at}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv["attributes"]["id"]).to eq(@inv.id)
    expect(inv["attributes"]["customer_id"]).to eq(@inv.customer_id)
    expect(inv["attributes"]["merchant_id"]).to eq(@inv.merchant_id)
    expect(inv["attributes"]["status"]).to eq(@inv.status)

    get "/api/v1/invoices/find?created_at=#{@inv_2.created_at}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv["attributes"]["id"]).to eq(@inv_2.id)
    expect(inv["attributes"]["customer_id"]).to eq(@inv_2.customer_id)
    expect(inv["attributes"]["merchant_id"]).to eq(@inv_2.merchant_id)
    expect(inv["attributes"]["status"]).to eq(@inv_2.status)
  end
  it 'finds by updated_at' do
    get "/api/v1/invoices/find?updated_at=#{@inv.updated_at}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv["attributes"]["id"]).to eq(@inv.id)
    expect(inv["attributes"]["customer_id"]).to eq(@inv.customer_id)
    expect(inv["attributes"]["merchant_id"]).to eq(@inv.merchant_id)
    expect(inv["attributes"]["status"]).to eq(@inv.status)

    get "/api/v1/invoices/find?updated_at=#{@inv_2.updated_at}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv["attributes"]["id"]).to eq(@inv_2.id)
    expect(inv["attributes"]["customer_id"]).to eq(@inv_2.customer_id)
    expect(inv["attributes"]["merchant_id"]).to eq(@inv_2.merchant_id)
    expect(inv["attributes"]["status"]).to eq(@inv_2.status)
  end
  it 'returns error if no records found' do
    get "/api/v1/invoices/find?merchant_id=23004304"

    expect(response).to be_successful

    error = JSON.parse(response.body)["data"]
    expect(error["type"]).to eq("api_error")
    expect(error["attributes"]["message"]).to eq("No records found with those params")
  end
end
