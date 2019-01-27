require 'rails_helper'

describe 'Customer - Favorite Merchant' do
  it 'returns merchant where customer has most successful transactions' do
    c_1 = create(:customer)
    m = create(:merchant)
    m_2 = create(:merchant)
    m_3 = create(:merchant)

    i = create(:invoice, customer: c_1, merchant: m, updated_at: 2.days.ago)
    t = create(:transaction, invoice: i, result: 'success')

    i_1 = create(:invoice, customer: c_1, merchant: m, updated_at: 2.days.ago)
    t_1 = create(:failed_transaction, invoice: i_1)

    i_2 = create(:invoice, customer: c_1, merchant: m, updated_at: 2.days.ago)
    t_2 = create(:transaction, invoice: i_2, result: 'success')

    i_3 = create(:invoice, customer: c_1, merchant: m_2, updated_at: 1.days.ago)
    t_3 = create(:transaction, invoice: i_3, result: 'success')

    get "/api/v1/customers/#{c_1.id}/favorite_merchant"

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json["type"]).to eq("merchant")
    expect(json["attributes"]["id"]).to eq(m.id)
    expect(json["attributes"]["name"]).to eq(m.name)
    expect(json["attributes"]["transaction_count"]).to eq(2)

    get "/api/v1/merchants/#{m_3.id}/favorite_customer"

    expect(response).to be_successful
    json = JSON.parse(response.body)["data"]
    expect(json["type"]).to eq("api_error")
    expect(json["attributes"]["message"]).to eq("No merchant found")
  end
end
