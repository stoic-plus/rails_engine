class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  
  def self.top_items_by_revenue(num=nil)
    joins("INNER JOIN invoice_items ON items.id=invoice_items.item_id
           INNER JOIN invoices ON invoice_items.invoice_id=invoices.id
           INNER JOIN transactions ON invoices.id=transactions.invoice_id")
    .select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
    .where("transactions.result = ?", 'success')
    .group(:id)
    .order("revenue DESC")
    .limit(num)
  end

  def self.top_items_by_quantity_sold(num=nil)
    joins("INNER JOIN invoice_items ON items.id=invoice_items.item_id
           INNER JOIN invoices ON invoice_items.invoice_id=invoices.id
           INNER JOIN transactions ON invoices.id=transactions.invoice_id")
    .select("items.*, SUM(invoice_items.quantity) AS quantity_sold")
    .where("transactions.result = ?", 'success')
    .group(:id)
    .order("quantity_sold DESC")
    .limit(num)
  end

end
