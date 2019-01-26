require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do

  end
  describe 'relationships' do

  end
  describe 'class methods' do
    before :each do
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
    end
    it '.most_revenue' do
      expect(Merchant.most_revenue(2)).to eq([@m_2, @m])
      expect(Merchant.most_revenue(3)).to eq([@m_2, @m, @m_3])
    end
    it '.most_items' do
      expect(Merchant.most_items(2)).to eq([@m_3, @m_2])
      expect(Merchant.most_items(3)).to eq([@m_3, @m_2, @m])
    end
  end
  describe 'instance methods' do
    it '#favorite_customer' do
      c_1 = create(:customer)
      c_2 = create(:customer)
      m = create(:merchant)

      i = create(:invoice, customer: c_1, merchant: m, updated_at: 2.days.ago)
      t = create(:transaction, invoice: i, result: 'success')

      i_1 = create(:invoice, customer: c_1, merchant: m, updated_at: 2.days.ago)
      t_1 = create(:failed_transaction, invoice: i_1)

      i_2 = create(:invoice, customer: c_2, merchant: m, updated_at: 2.days.ago)
      t_2 = create(:transaction, invoice: i_2, result: 'success')

      i_3 = create(:invoice, customer: c_2, merchant: m, updated_at: 1.days.ago)
      t_3 = create(:transaction, invoice: i_3, result: 'success')

      expect(m.favorite_customer).to eq(c_2)
    end
  end
end
