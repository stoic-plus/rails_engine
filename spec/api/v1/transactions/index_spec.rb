require 'rails_helper'

describe 'Transactions - Index' do
  it 'returns all transactions' do
    c = create(:customer)
    m = create(:merchant)
    inv = create(:invoice, customer: c, merchant: m)
    inv_2 = create(:invoice, customer: c, merchant: m)
    t_1 = create(:transaction, invoice: inv)
    t_2 = create(:transaction, invoice: inv_2)

    get '/api/v1/transactions.json'

    expect(response).to be_successful

    transactions = JSON.parse(response.body)["data"]
    expect(transactions[0]["attributes"]["id"]).to eq(t_1.id)
    expect(transactions[0]["attributes"]["invoice_id"]).to eq(t_1.invoice_id)
    expect(transactions[0]["attributes"]["credit_card_number"]).to eq(t_1.credit_card_number)
    expect(transactions[0]["attributes"]["credit_card_expiration_date"]).to eq(t_1.credit_card_expiration_date.xmlschema(3))
    expect(transactions[0]["attributes"]["result"]).to eq(t_1.result)

    expect(transactions[1]["attributes"]["id"]).to eq(t_2.id)
    expect(transactions[1]["attributes"]["invoice_id"]).to eq(t_2.invoice_id)
    expect(transactions[1]["attributes"]["credit_card_number"]).to eq(t_2.credit_card_number)
    expect(transactions[1]["attributes"]["credit_card_expiration_date"]).to eq(t_2.credit_card_expiration_date.xmlschema(3))
    expect(transactions[1]["attributes"]["result"]).to eq(t_2.result)
  end
end
