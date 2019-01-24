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

  def self.revenue_by_date(date_time)
   Invoice.joins(:invoice_items, :transactions)
    .select("SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .where("transactions.result = ? AND DATE_TRUNC('day', invoices.updated_at) = ?", 'success', date_time.to_date)
    .group("DATE_TRUNC('day', invoices.updated_at)")[0]
    .revenue
  end
end
