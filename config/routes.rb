WebCasts::Application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :screencasts do
    resources :commentaires
  end

  devise_scope :user do
    get "login", :to => "devise/sessions#new"
  end
  
  resources :categories
  root to: "screencasts#index"

  post "nouveau-favori", to: 'favoris#new', as: 'new_fav'
  post "delete-favori", to: 'favoris#delete', as: 'del_fav'

  post "search", to: 'screencasts#search'
  get "mes-favoris", to: 'favoris#mes_favoris', as: 'mes_favoris'

  post "screencasts-videos", to: 'screencasts#get_last_videos'
end
