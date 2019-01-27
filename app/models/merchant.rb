class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.most_revenue(x)
    joins(invoices: [:invoice_items, :transactions])
    .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .where("transactions.result = ?", 'success')
    .group(:id)
    .order("revenue DESC")
    .limit(x)
  end

  def self.most_items(x)
    joins(invoices: [:invoice_items, :transactions])
    .select("merchants.*, SUM(invoice_items.quantity) AS items_sold")
    .where("transactions.result = ?", 'success')
    .group(:id)
    .order("items_sold DESC")
    .limit(x)
  end

  def self.favorite_merchant_for(customer_id)
    joins(invoices: [:transactions])
      .select("merchants.*, COUNT(transactions.id) AS transaction_count")
      .where("transactions.result = ? AND invoices.customer_id = ?", 'success', customer_id)
      .group(:id)
      .order("transaction_count DESC")
      .limit(1)[0]
  end
end
