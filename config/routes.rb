Rails.application.routes.draw do
  root 'static_pages#home'

  resources :billboards do
    resources :songs
  end
  resources :artists do
    resources :songs
  end

  get '/billboards/:billboard_id/add_song/:id', to: 'billboards#add_song'

end
