Rails.application.routes.draw do
  resources :orders, only: [:create]
  resources :set_meals do
    collection do
      get :popular_set_meals
    end
  end
  resource :group_orders do
    collection do
      get :current_group_orders
      get :group_orders
    end
  end
end
