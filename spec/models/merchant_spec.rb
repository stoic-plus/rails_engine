require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do

  end
  describe 'relationships' do

  end
  describe 'class methods' do
    it '.most_revenue' do
      c = create(:customer)
      m = create(:merchant)
      m_2 = create(:merchant)
      item = create(:item, merchant: m)
      item_2 = create(:item, merchant: m_2)

      i = create(:invoice, customer: c, merchant: m)
      ii = create(:invoice_item, item: item, invoice: i, quantity: 2, unit_price: 2)
      t = create(:transaction, invoice: i, result: 'success')

      i_1 = create(:invoice, customer: c, merchant: m_2)
      ii_1 = create(:invoice_item, item: item_2, invoice: i_1, quantity: 2, unit_price: 5)
      t_1 = create(:transaction, invoice: i_1, result: 'success')

      i_2 = create(:invoice, customer: c, merchant: m)
      ii_2 = create(:invoice_item, item: item, invoice: i_2, quantity: 2, unit_price: 12)
      t_2 = create(:failed_transaction, invoice: i_2)

      expect(Merchant.most_revenue(2)).to eq([m_2, m])
    end
  end
end
