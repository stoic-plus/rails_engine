class Customer < ApplicationRecord
  has_many :invoices

  def self.favorite_customer_for(merchant_id, num=1)
    joins(invoices: [:transactions])
      .where("transactions.result = ? AND invoices.merchant_id = ?", 'success', merchant_id)
      .group(:id)
      .order("COUNT(transactions.id) AS transaction_count")
      .limit(num)
  end
end
