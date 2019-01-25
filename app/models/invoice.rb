class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant

  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.revenue_by_date(date_time)
    joins(:invoice_items, :transactions)
     .select("SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
     .where("transactions.result = ? AND DATE_TRUNC('day', invoices.updated_at) = ?", 'success', date_time.to_date)
     .group("DATE_TRUNC('day', invoices.updated_at)")[0]
     .revenue
  end
end
