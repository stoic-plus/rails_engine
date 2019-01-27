require 'rails_helper'

describe 'Items - Best Day' do
  it 'returns date with most sales for given item' do
    c = create(:customer)
    m = create(:merchant)
    item_1 = create(:item, merchant: m)
    days_3_ago = 3.days.ago
    days_2_ago = 2.days.ago
    day_1_ago = 1.days.ago

    inv_1 = create(:invoice, customer: c, merchant: m, updated_at: days_3_ago)
    ii_1 = create(:invoice_item, invoice: inv_1, item: item_1, quantity: 5)
    create(:transaction, invoice: inv_1)

    inv_2 = create(:invoice, customer: c, merchant: m, updated_at: days_2_ago)
    ii_2 = create(:invoice_item, invoice: inv_2, item: item_1, quantity: 6)
    create(:transaction, invoice: inv_2)

    inv_3 = create(:invoice, customer: c, merchant: m, updated_at: day_1_ago)
    ii_3 = create(:invoice_item, invoice: inv_3, item: item_1, quantity: 6)
    create(:transaction, invoice: inv_3)

    get "/api/v1/items/#{item_1.id}/best_day"

    expect(response).to be_successful

    json = JSON.parse(response.body)["data"]

    expect(json["attributes"]["date"]).to eq(day_1_ago)
    expect(json["attributes"]["total_sales"]).to eq(6)
  end
end
