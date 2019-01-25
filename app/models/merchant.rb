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
end
