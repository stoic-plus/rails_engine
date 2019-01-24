Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      namespace :merchants do
        get '/:id/items', to: "items#index", as: "items"
        get '/:id/invoices', to: "invoices#index", as: "invoices"
        get '/revenue', to: "revenues#index", as: "revenues"
        get '/:id/revenue', to: "revenues#show", as: "revenue"
        get '/most_revenue', to: "most_revenue#index", as: "most_revenue"
        get '/most_items', to: "most_items#index", as: "most_items"
      end
    end
  end
end
