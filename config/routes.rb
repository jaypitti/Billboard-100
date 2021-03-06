Rails.application.routes.draw do
  get 'profiles/new'

  get 'profiles/show'

  get 'profiles/edit'

  devise_for :users
  root 'static_pages#home'

  resources :billboards
  resources :artists do
    resources :songs
  end

  resources :billboards do
    member do
      get :add_song
      get :add_song_to_billboard
    end
  end
end
