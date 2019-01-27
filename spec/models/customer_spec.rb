require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'class methods' do
    it '.favorite_customer_for' do
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

      expect(Customer.favorite_customer_for(m.id)).to eq(c_2)
    end
  end
end
