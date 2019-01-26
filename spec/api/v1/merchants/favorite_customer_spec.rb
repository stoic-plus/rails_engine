require 'rails_helper'

describe 'Merchant - Favorite Customer' do
  it 'returns customer with most successful transactions' do
    c_1 = create(:customer)
    c_2 = create(:customer)
    m = create(:merchant)
    m_2 = create(:merchant)

    i = create(:invoice, customer: c_1, merchant: m, updated_at: 2.days.ago)
    t = create(:transaction, invoice: i, result: 'success')

    i_1 = create(:invoice, customer: c_1, merchant: m, updated_at: 2.days.ago)
    t_1 = create(:failed_transaction, invoice: i_1)

    i_2 = create(:invoice, customer: c_2, merchant: m, updated_at: 2.days.ago)
    t_2 = create(:transaction, invoice: i_2, result: 'success')

    i_3 = create(:invoice, customer: c_2, merchant: m, updated_at: 1.days.ago)
    t_3 = create(:transaction, invoice: i_3, result: 'success')

    get "/api/v1/merchants/#{m.id}/favorite_customer"

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json["type"]).to eq("customer")
    expect(json["attributes"]["id"]).to eq(c_2.id)
    expect(json["attributes"]["first_name"]).to eq(c_2.first_name)
    expect(json["attributes"]["last_name"]).to eq(c_2.last_name)
    expect(json["attributes"]["transaction_count"]).to eq(2)

    get "/api/v1/merchants/#{m_2.id}/favorite_customer"

    expect(response).to be_successful
    json = JSON.parse(response.body)["data"]
    expect(json["type"]).to eq("api_error")
    expect(json["attributes"]["message"]).to eq("No customer found")
  end
end
