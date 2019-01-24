require 'rails_helper'

describe 'Merchant - Items Request' do
  it 'sends a list of items for this merchant' do
    m = create(:merchant)
    item_1 = create(:item, merchant: m)
    item_2 = create(:item, merchant: m)
    item_3 = create(:item, merchant: m)

    get "/api/v1/merchants/#{m.id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)

    expect(items.count).to eq(3)
  end
end
