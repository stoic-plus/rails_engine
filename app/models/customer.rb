class Customer < ApplicationRecord
  has_many :invoices

  def self.favorite_customer_for(merchant_id, num=1)
    joins(invoices: [:transactions])
      .select("customers.*, COUNT(transactions.id) AS transaction_count")
      .where("transactions.result = ? AND invoices.merchant_id = ?", 'success', merchant_id)
      .group(:id)
      .order("transaction_count DESC")
      .limit(num)[0]
  end
end
