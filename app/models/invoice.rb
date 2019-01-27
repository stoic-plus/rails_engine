class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant

  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.total_revenue_by_date(date_time)
    total_rev = self.joins(:invoice_items, :transactions)
     .select("SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
     .where("transactions.result = ? AND DATE_TRUNC('day', invoices.updated_at) = ?", 'success', date_time.to_date)
     .group("DATE_TRUNC('day', invoices.updated_at)")

     return nil if total_rev.empty?
     return total_rev[0].revenue
  end

  def self.total_revenue
    joins(:invoice_items, :transactions)
     .select("SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
     .where("transactions.result = ?", 'success')[0]
     .revenue
  end

  def self.best_day_for(item_id)
    joins(:invoice_items, :transactions)
      .select("DATE_TRUNC('day', invoices.updated_at) AS day")
      .where({invoice_items: {item_id: item_id}, transactions: {result: 'success'}})
      .group("DATE_TRUNC('day', invoices.updated_at)")
      .order("SUM(invoice_items.quantity) DESC, DATE_TRUNC('day', invoices.updated_at) DESC")
      .limit(1)[0].day
  end
end
