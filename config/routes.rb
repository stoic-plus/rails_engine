Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/merchants.json', to: "merchants#index", as: "merchants"
      get '/customers.json', to: "customers#index", as: "customers"
      get '/invoices.json', to: "invoices#index", as: "invoices"
      get '/items.json', to: "items#index", as: "items"
      get '/transactions.json', to: "transactions#index", as: "transactions"
      namespace :merchants do
        get '/find_all', to: "search#index", as: "find_all"
        get '/find', to: "search#show", as: "find"
        get '/:id/items', to: "items#index", as: "items"
        get '/:id/invoices', to: "invoices#index", as: "invoices"
        get '/revenue', to: "revenues#index", as: "revenues"
        get '/:id/revenue', to: "revenues#show", as: "revenue"
        get '/:id/favorite_customer', to: "favorite_customer#index", as: "favorite_customer"
        get '/most_revenue', to: "most_revenue#index", as: "most_revenue"
        get '/most_items', to: "most_items#index", as: "most_items"
      end
      namespace :invoices do
        get '/find_all', to: "search#index", as: "find_all"
        get '/find', to: "search#show", as: "find"
        get '/:id/transactions', to: "transactions#index", as: "transactions"
        get ":id/invoice_items", to: "invoice_items#index", as: "invoice_items"
        get ":id/items", to: "items#index", as: "items"
        get ":id/customer", to: "customer#index", as: "customer"
        get ":id/merchant", to: "merchant#index", as: "merchant"
      end
      namespace :items do
        get '/find_all', to: "search#index", as: "find_all"
        get '/find', to: "search#show", as: "find"
        get '/most_revenue', to: "most_revenue#index", as: "most_revenue"
        get '/most_items', to: "most_items#index", as: "most_items"
        get '/:id/best_day', to: "best_day#index", as: "best_day"
        get '/:id/invoice_items', to: "invoice_items#index", as: "invoice_items"
        get '/:id/merchant', to: "merchant#index", as: "merchant"
      end
      namespace :customers do
        get '/find_all', to: "search#index", as: "find_all"
        get '/find', to: "search#show", as: "find"
        get '/:id/favorite_merchant', to: "favorite_merchant#index", as: "favorite_merchant"
        get '/:id/invoices', to: "invoices#index", as: "invoices"
        get '/:id/transactions', to: "transactions#index", as: "transactions"
      end
      namespace :transactions do
        get '/find_all', to: "search#index", as: "find_all"
        get '/find', to: "search#show", as: "find"
        get '/:id/invoice', to: "invoice#index", as: "invoice"
      end
      namespace :invoice_items do
        get '/:id/invoice', to: "invoice#index", as: "invoice"
        get '/:id/item', to: "item#index", as: "item"
      end
    end
  end
end

#
# GET /api/v1/invoices/:id/transactions returns a collection of associated transactions
# GET /api/v1/invoices/:id/invoice_items returns a collection of associated invoice items
# GET /api/v1/invoices/:id/items returns a collection of associated items
# GET /api/v1/invoices/:id/customer returns the associated customer
# GET /api/v1/invoices/:id/merchant returns the associated merchant
