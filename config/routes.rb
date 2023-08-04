Rails.application.routes.draw do
  resources :merchants, only: %i[create] do
    resources :orders, only: %i[create]
  end
end
