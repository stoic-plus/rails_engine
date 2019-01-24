class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices

  def self.most_revenue(x)
    joins(
      "INNER JOIN invoices ON invoices.merchant_id=merchants.id
       INNER JOIN invoice_items ON invoice_items.invoice_id=invoices.id
       INNER JOIN transactions ON transactions.invoice_id=invoices.id")
    .select("merchants.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .where("transactions.result = ?", 'success')
    .group(:id)
    .order("revenue DESC")
    .limit(x)
  end
end
