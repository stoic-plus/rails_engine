require 'rails_helper'

describe 'Invoice - All Finders' do
  before :each do
    c = create(:customer)
    c_2 = create(:customer)
    m = create(:merchant)
    m_2 = create(:merchant)

    @inv = create(:invoice, customer: c, merchant: m, status: 'pending', created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")
    @inv_a = create(:invoice, customer: c, merchant: m, status: 'pending', created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")

    @inv_2 = create(:invoice, customer: c_2, merchant: m_2, created_at: "2012-03-21 14:54:09 UTC", updated_at: "2012-03-21 14:54:09 UTC")
    @inv_2_a = create(:invoice, customer: c_2, merchant: m_2, created_at: "2012-03-21 14:54:09 UTC", updated_at: "2012-03-21 14:54:09 UTC")
  end
  it 'finds all by id' do
    get "/api/v1/invoices/find_all?id=#{@inv_a.id}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv[0]["attributes"]["id"]).to eq(@inv_a.id)
    expect(inv[0]["attributes"]["customer_id"]).to eq(@inv_a.customer_id)
    expect(inv[0]["attributes"]["merchant_id"]).to eq(@inv_a.merchant_id)
    expect(inv[0]["attributes"]["status"]).to eq(@inv_a.status)

    get "/api/v1/invoices/find_all?id=#{@inv_2_a.id}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv[0]["attributes"]["id"]).to eq(@inv_2_a.id)
    expect(inv[0]["attributes"]["customer_id"]).to eq(@inv_2_a.customer_id)
    expect(inv[0]["attributes"]["merchant_id"]).to eq(@inv_2_a.merchant_id)
    expect(inv[0]["attributes"]["status"]).to eq(@inv_2_a.status)
  end
  it 'finds all by customer_id' do
    get "/api/v1/invoices/find_all?customer_id=#{@inv.customer_id}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv[0]["attributes"]["id"]).to eq(@inv.id)
    expect(inv[0]["attributes"]["customer_id"]).to eq(@inv.customer_id)
    expect(inv[0]["attributes"]["merchant_id"]).to eq(@inv.merchant_id)
    expect(inv[0]["attributes"]["status"]).to eq(@inv.status)

    expect(inv[1]["attributes"]["id"]).to eq(@inv_a.id)
    expect(inv[1]["attributes"]["customer_id"]).to eq(@inv_a.customer_id)
    expect(inv[1]["attributes"]["merchant_id"]).to eq(@inv_a.merchant_id)
    expect(inv[1]["attributes"]["status"]).to eq(@inv_a.status)
  end
  it 'finds all by merchant_id' do
    get "/api/v1/invoices/find_all?merchant_id=#{@inv.merchant_id}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv[0]["attributes"]["id"]).to eq(@inv.id)
    expect(inv[0]["attributes"]["customer_id"]).to eq(@inv.customer_id)
    expect(inv[0]["attributes"]["merchant_id"]).to eq(@inv.merchant_id)
    expect(inv[0]["attributes"]["status"]).to eq(@inv.status)

    expect(inv[1]["attributes"]["id"]).to eq(@inv_a.id)
    expect(inv[1]["attributes"]["customer_id"]).to eq(@inv_a.customer_id)
    expect(inv[1]["attributes"]["merchant_id"]).to eq(@inv_a.merchant_id)
    expect(inv[1]["attributes"]["status"]).to eq(@inv_a.status)
  end
  it 'finds all by status' do
    get "/api/v1/invoices/find_all?status=#{@inv_2.status}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv[0]["attributes"]["id"]).to eq(@inv_2.id)
    expect(inv[0]["attributes"]["customer_id"]).to eq(@inv_2.customer_id)
    expect(inv[0]["attributes"]["merchant_id"]).to eq(@inv_2.merchant_id)
    expect(inv[0]["attributes"]["status"]).to eq(@inv_2.status)

    expect(inv[1]["attributes"]["id"]).to eq(@inv_2_a.id)
    expect(inv[1]["attributes"]["customer_id"]).to eq(@inv_2_a.customer_id)
    expect(inv[1]["attributes"]["merchant_id"]).to eq(@inv_2_a.merchant_id)
    expect(inv[1]["attributes"]["status"]).to eq(@inv_2_a.status)
  end
  it 'finds all by created_at' do
    get "/api/v1/invoices/find_all?created_at=#{@inv.created_at}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv[0]["attributes"]["id"]).to eq(@inv.id)
    expect(inv[0]["attributes"]["customer_id"]).to eq(@inv.customer_id)
    expect(inv[0]["attributes"]["merchant_id"]).to eq(@inv.merchant_id)
    expect(inv[0]["attributes"]["status"]).to eq(@inv.status)

    expect(inv[1]["attributes"]["id"]).to eq(@inv_a.id)
    expect(inv[1]["attributes"]["customer_id"]).to eq(@inv_a.customer_id)
    expect(inv[1]["attributes"]["merchant_id"]).to eq(@inv_a.merchant_id)
    expect(inv[1]["attributes"]["status"]).to eq(@inv_a.status)
  end
  it 'finds all by updated_at' do
    get "/api/v1/invoices/find_all?updated_at=#{@inv.updated_at}"

    expect(response).to be_successful

    inv = JSON.parse(response.body)["data"]
    expect(inv[0]["attributes"]["id"]).to eq(@inv.id)
    expect(inv[0]["attributes"]["customer_id"]).to eq(@inv.customer_id)
    expect(inv[0]["attributes"]["merchant_id"]).to eq(@inv.merchant_id)
    expect(inv[0]["attributes"]["status"]).to eq(@inv.status)

    expect(inv[1]["attributes"]["id"]).to eq(@inv_a.id)
    expect(inv[1]["attributes"]["customer_id"]).to eq(@inv_a.customer_id)
    expect(inv[1]["attributes"]["merchant_id"]).to eq(@inv_a.merchant_id)
    expect(inv[1]["attributes"]["status"]).to eq(@inv_a.status)
  end
  it 'returns error if no records found' do
    get "/api/v1/invoices/find_all?status=paid"

    expect(response).to be_successful

    error = JSON.parse(response.body)["data"]
    expect(error["type"]).to eq("api_error")
    expect(error["attributes"]["message"]).to eq("No records found with those params")
  end
end
