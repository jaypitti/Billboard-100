Rails.application.routes.draw do
  root 'static_pages#home'

  resources :billboards
  resources :artists do
    resources :songs
  end

end
