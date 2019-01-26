require 'rails_helper'

describe 'Merchants - Revenue By Date' do
  it 'returns total revenue for a date' do
    c = create(:customer)
    @m = create(:merchant)
    @m_2 = create(:merchant)
    @m_3 = create(:merchant)
    item = create(:item, merchant: @m)
    item_2 = create(:item, merchant: @m_2)
    item_3 = create(:item, merchant: @m_3)

    i = create(:invoice, customer: c, merchant: @m, updated_at: 2.days.ago)
    ii = create(:invoice_item, item: item, invoice: i, quantity: 2, unit_price: 2)
    t = create(:transaction, invoice: i, result: 'success')

    i_1 = create(:invoice, customer: c, merchant: @m, updated_at: 2.days.ago)
    ii_1 = create(:invoice_item, item: item, invoice: i_1, quantity: 20, unit_price: 12)
    t_1 = create(:failed_transaction, invoice: i_1)

    i_2 = create(:invoice, customer: c, merchant: @m_2, updated_at: 2.days.ago)
    ii_2 = create(:invoice_item, item: item_2, invoice: i_2, quantity: 3, unit_price: 5)
    t_2 = create(:transaction, invoice: i_2, result: 'success')

    i_3 = create(:invoice, customer: c, merchant: @m_3, updated_at: 1.days.ago)
    ii_3 = create(:invoice_item, item: item_3, invoice: i_3, quantity: 4, unit_price: 1)
    t_3 = create(:transaction, invoice: i_3, result: 'success')

    get "/api/v1/merchants/revenue?date=#{2.days.ago}"

    expect(response).to be_successful

    total_rev = JSON.parse(response.body)["data"]
    expect(total_rev["total_revenue"]).to eq(19)
    expect(total_rev["date"]).to eq(2.days.ago.to_s)

    get "/api/v1/merchants/revenue?date=#{1.days.ago}"

    expect(response).to be_successful

    total_rev = JSON.parse(response.body)["data"]
    expect(total_rev["total_revenue"]).to eq(4)
    expect(total_rev["date"]).to eq(1.days.ago.to_s)

    get "/api/v1/merchants/revenue?date=#{4.days.ago}"

    expect(response).to be_successful
    response = JSON.parse(response.body)["data"]
    expect(response).to eq({
      message: "No results found for date",
      date: 4.days.ago.to_s
    })
  end
end
