require 'rails_helper'

describe 'Customers - Transactions Request' do
  it 'returns transactions for this customer' do
    c = create(:customer)
    m = create(:merchant)

    invoice = create(:invoice, customer: c, merchant: m)
    t_1 = create(:transaction, invoice: invoice)
    t_2 = create(:failed_transaction, invoice: invoice)

    get "/api/v1/customers/#{c.id}/transactions"

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]
    expect(json[0]["attributes"]["id"]).to eq(t_1.id)
    expect(json[0]["attributes"]["invoice_id"]).to eq(t_1.invoice_id)
    expect(json[0]["attributes"]["credit_card_number"]).to eq(t_1.credit_card_number)
    expect(json[0]["attributes"]["credit_card_expiration_date"]).to eq(t_1.credit_card_expiration_date.xmlschema(3))
    expect(json[0]["attributes"]["result"]).to eq(t_1.result)

    expect(json[1]["attributes"]["id"]).to eq(t_2.id)
    expect(json[1]["attributes"]["invoice_id"]).to eq(t_2.invoice_id)
    expect(json[1]["attributes"]["credit_card_number"]).to eq(t_2.credit_card_number)
    expect(json[1]["attributes"]["credit_card_expiration_date"]).to eq(t_2.credit_card_expiration_date.xmlschema(3))
    expect(json[1]["attributes"]["result"]).to eq(t_2.result)
  end
end
