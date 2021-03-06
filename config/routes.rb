Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories, only: %w(index)
      resources :products, only: %w(index update) do
        collection do
          get :details
        end
      end
    end
  end
end
