require 'rails_helper'

describe 'Invoice - Transactions Request' do
  it 'returns a list of transactions for this invoice' do
    c = create(:customer)
    m = create(:merchant)
    invoice = create(:invoice, customer: c, merchant: m)
    ft = create(:failed_transaction, invoice: invoice)
    t = create(:transaction, invoice: invoice)

    invoice_2 = create(:invoice, customer: c, merchant: m)
    t = create(:transaction, invoice: invoice_2)
    ft = create(:failed_transaction, invoice: invoice_2)

    get "/api/v1/invoices/#{invoice.id}/transactions"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions.count).to eq(2)
    invoice.transactions.each_with_index do |tran, i|
      expect(transactions[i]["attributes"]["id"]).to eq(tran.id)
      expect(transactions[i]["attributes"]["invoice_id"]).to eq(tran.invoice_id)
      expect(transactions[i]["attributes"]["credit_card_number"]).to eq(tran.credit_card_number)
      expect(transactions[i]["attributes"]["credit_card_expiration_date"]).to eq(tran.credit_card_expiration_date)
      expect(transactions[i]["attributes"]["result"]).to eq(tran.result)
    end
  end
end
