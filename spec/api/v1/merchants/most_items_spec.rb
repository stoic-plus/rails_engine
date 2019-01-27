require 'rails_helper'

describe 'Merchants - Most Items' do
  it 'returns top merchants ranked by items sold' do
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

    get '/api/v1/merchants/most_items?quantity=2'

    expect(response).to be_successful

    top_merch_api = JSON.parse(response.body)["data"]
    expect(top_merch_api.count).to eq(2)
    top_merch = [@m_3, @m_2]

    top_merch_api.each_with_index do |m, index|
      expect(top_merch[index].id).to eq(m["attributes"]["id"])
      expect(top_merch[index].name).to eq(m["attributes"]["name"])
    end

    get '/api/v1/merchants/most_items?quantity=3'

    expect(response).to be_successful

    top_merch_api = JSON.parse(response.body)["data"]
    expect(top_merch_api.count).to eq(3)
    top_merch = [@m_3, @m_2, @m]

    top_merch_api.each_with_index do |m, index|
      expect(top_merch[index].id).to eq(m["attributes"]["id"])
      expect(top_merch[index].name).to eq(m["attributes"]["name"])
    end
  end
end
