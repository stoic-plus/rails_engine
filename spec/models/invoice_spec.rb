require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'class methods' do
    before :each do
      c = create(:customer)
      @m = create(:merchant)
      @m_2 = create(:merchant)
      @m_3 = create(:merchant)
      @item = create(:item, merchant: @m)
      @item_2 = create(:item, merchant: @m_2)
      @item_3 = create(:item, merchant: @m_3)

      i = create(:invoice, customer: c, merchant: @m, updated_at: 2.days.ago)
      ii = create(:invoice_item, item: @item, invoice: i, quantity: 2, unit_price: 2)
      t = create(:transaction, invoice: i, result: 'success')

      i_1 = create(:invoice, customer: c, merchant: @m, updated_at: 2.days.ago)
      ii_1 = create(:invoice_item, item: @item, invoice: i_1, quantity: 20, unit_price: 12)
      t_1 = create(:failed_transaction, invoice: i_1)

      i_2 = create(:invoice, customer: c, merchant: @m_2, updated_at: 2.days.ago)
      ii_2 = create(:invoice_item, item: @item_2, invoice: i_2, quantity: 3, unit_price: 5)
      t_2 = create(:transaction, invoice: i_2, result: 'success')

      i_3 = create(:invoice, customer: c, merchant: @m_3, updated_at: 1.days.ago)
      ii_3 = create(:invoice_item, item: @item_3, invoice: i_3, quantity: 4, unit_price: 2)
      t_3 = create(:transaction, invoice: i_3, result: 'success')
    end

    it '.revenue_by_date' do
      expect(Invoice.total_revenue_by_date(2.days.ago)).to eq(19)
      expect(Invoice.total_revenue_by_date(1.days.ago)).to eq(8)
    end
    it '.best_day_for' do
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

      best_day = Invoice.best_day_for(item_1.id)
      expect(best_day.day.to_date).to eq(day_1_ago.to_date)
      expect(best_day.quantity_sold).to eq(6)
    end
  end
end
