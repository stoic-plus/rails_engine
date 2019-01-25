require 'rails_helper'

describe 'Merchant - Invoices Request' do
  it 'sends a list of invoices for this merchant' do
    c = create(:customer)
    m = create(:merchant)
    inv_1 = create(:invoice, customer: c, merchant: m)
    inv_2 = create(:invoice, customer: c, merchant: m)
    inv_3 = create(:invoice, customer: c, merchant: m)

    m_1 = create(:merchant)
    inv_4 = create(:invoice, customer: c, merchant: m_1)
    inv_5 = create(:invoice, customer: c, merchant: m_1)
    inv_6 = create(:invoice, customer: c, merchant: m_1)

    get "/api/v1/merchants/#{m.id}/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)["data"]
    expect(invoices.count).to eq(3)
    m.invoices.each_with_index do |inv, i|
      expect(invoices[i]["attributes"]["id"]).to eq(inv.id)
      expect(invoices[i]["attributes"]["customer_id"]).to eq(inv.customer_id)
      expect(invoices[i]["attributes"]["merchant_id"]).to eq(inv.merchant_id)
      expect(invoices[i]["attributes"]["status"]).to eq(inv.status)
    end
  end
end
