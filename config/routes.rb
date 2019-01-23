Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show]
      namespace :merchants do
        get '/revenue', to: "business_data#revenue", as: "merchants_revenue"
        get '/:id/revenue', to: "business_data#revenue", as: "merchant_revenue"
        get '/most_revenue', to: "business_data#most_revenue", as: "most_revenue"
        get '/most_items', to: "business_data#most_items", as: "most_items"
      end
    end
  end
end
