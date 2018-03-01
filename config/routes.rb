Rails.application.routes.draw do
  root 'static_pages#home'

  resources :billboards do
    resources :songs
  end
  resources :artists do
    resources :songs
  end
end
