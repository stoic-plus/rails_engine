require 'csv'

namespace :import do
  desc "import customers"
  task customers: :environment do
    CSV.foreach('./lib/data/customers.csv', headers: true) do |row|
      Customer.create(row.to_h)
    end
  end

  desc "import merchants"
  task merchants: :environment do
    CSV.foreach('./lib/data/merchants.csv', headers: true) do |row|
      Merchant.create(row.to_h)
    end
  end

  desc "import invoices"
  task invoices: :environment do
    CSV.foreach('./lib/data/invoices.csv', headers: true) do |row|
      Invoice.create(row.to_h)
    end
  end

  desc "import items"
  task items: :environment do
    CSV.foreach('./lib/data/items.csv', headers: true) do |row|
      Item.create(row.to_h)
    end
  end

  desc "import transactions"
  task transactions: :environment do
    CSV.foreach('./lib/data/transactions.csv', headers: true) do |row|
      Transaction.create(row.to_h)
    end
  end

  desc "import invoice items"
  task invoice_items: :environment do
    CSV.foreach('./lib/data/invoice_items.csv', headers: true) do |row|
      InvoiceItem.create(row.to_h)
    end
  end

  desc "import all"
  task import_all: :environment do
    Rake::Task["import:customers"].invoke
    Rake::Task["import:merchants"].invoke
    Rake::Task["import:invoices"].invoke
    Rake::Task["import:items"].invoke
    Rake::Task["import:transactions"].invoke
    Rake::Task["import:invoice_items"].invoke
  end
end
