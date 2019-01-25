Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/:id/items', to: "items#index", as: "items"
        get '/:id/invoices', to: "invoices#index", as: "invoices"
        get '/revenue', to: "revenues#index", as: "revenues"
        get '/:id/revenue', to: "revenues#show", as: "revenue"
        get '/most_revenue', to: "most_revenue#index", as: "most_revenue"
        get '/most_items', to: "most_items#index", as: "most_items"
      end
      resources :merchants, only: [:index, :show]
      namespace :invoices do
        get '/:id/transactions', to: "transactions#index", as: "transactions"
        get ":id/invoice_items", to: "invoice_items#index", as: "invoice_items"
        get ":id/items", to: "items#index", as: "items"
        get ":id/customer", to: "customer#index", as: "customer"
        get ":id/merchant", to: "merchant#index", as: "merchant"
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
