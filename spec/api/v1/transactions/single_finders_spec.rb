require 'rails_helper'

describe 'Transactions - Single Finders' do
  before :each do
    c = create(:customer)
    m = create(:merchant)
    inv = create(:invoice, customer: c, merchant: m)
    inv_2 = create(:invoice, customer: c, merchant: m)
    @t = create(:transaction, invoice: inv, result: 'failed', credit_card_expiration_date: "2019-03-27 14:54:09 UTC", created_at: "2012-03-27 14:54:09 UTC", updated_at: "2012-03-27 14:54:09 UTC")
    @t_2 = create(:transaction, invoice: inv_2,  credit_card_expiration_date: "2019-03-18 14:54:09 UTC", created_at: "2012-03-21 14:54:09 UTC", updated_at: "2012-03-21 14:54:09 UTC")
  end
  it 'finds by id' do
    get "/api/v1/transactions/find?id=#{@t.id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t.result)

    get "/api/v1/transactions/find?id=#{@t_2.id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t_2.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t_2.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t_2.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t_2.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t_2.result)
  end
  it 'finds by invoice_id' do
    get "/api/v1/transactions/find?invoice_id=#{@t.invoice_id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t.result)

    get "/api/v1/transactions/find?invoice_id=#{@t_2.invoice_id}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t_2.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t_2.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t_2.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t_2.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t_2.result)
  end
  it 'finds by credit_card_number' do
    get "/api/v1/transactions/find?credit_card_number=#{@t.credit_card_number}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t.result)

    get "/api/v1/transactions/find?credit_card_number=#{@t_2.credit_card_number}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t_2.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t_2.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t_2.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t_2.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t_2.result)
  end
  it 'finds by credit_card_expiration_date' do
    get "/api/v1/transactions/find?credit_card_expiration_date=#{@t.credit_card_expiration_date}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t.result)

    get "/api/v1/transactions/find?credit_card_expiration_date=#{@t_2.credit_card_expiration_date}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t_2.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t_2.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t_2.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t_2.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t_2.result)
  end
  it 'finds by result' do
    get "/api/v1/transactions/find?result=#{@t.result}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t.result)

    get "/api/v1/transactions/find?result=#{@t_2.result}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t_2.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t_2.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t_2.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t_2.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t_2.result)
  end
  it 'finds by created_at' do
    get "/api/v1/transactions/find?created_at=#{@t.created_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t.result)

    get "/api/v1/transactions/find?created_at=#{@t_2.created_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t_2.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t_2.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t_2.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t_2.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t_2.result)
  end
  it 'finds by updated_at' do
    get "/api/v1/transactions/find?updated_at=#{@t.updated_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t.result)

    get "/api/v1/transactions/find?updated_at=#{@t_2.updated_at}"

    expect(response).to be_successful

    transaction = JSON.parse(response.body)["data"]
    expect(transaction["attributes"]["id"]).to eq(@t_2.id)
    expect(transaction["attributes"]["invoice_id"]).to eq(@t_2.invoice_id)
    expect(transaction["attributes"]["credit_card_number"]).to eq(@t_2.credit_card_number)
    expect(transaction["attributes"]["credit_card_expiration_date"]).to eq(@t_2.credit_card_expiration_date.xmlschema(3))
    expect(transaction["attributes"]["result"]).to eq(@t_2.result)
  end
  it 'returns error if no records found' do
    get "/api/v1/transactions/find?result=justperfect"

    expect(response).to be_successful

    error = JSON.parse(response.body)["data"]
    expect(error["attributes"]["message"]).to eq("No records found with those params")
  end
end
