Rails.application.routes.draw do
  resources :merchants, only: %i[create]
end
