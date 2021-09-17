Rails.application.routes.draw do

  
  #ユーザーのログイン
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  
  #Adminへのログイン
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }
  
  
  namespace :admins do
    root 'homes#top'
    resources :genres,      onry: [:index, :destroy, :create]
    resources :answers,     onry: [:index, :show,:update, :create]
    resources :users,       onry: [:index, :show, :update]
    resources :boards,       onry: [:new, :show, :index, :create, :destroy]
    
    get '/search',                  to: 'searchs#search'
    get '/board_search',            to: 'board_searchs#search'
  end
  
  
  
  # USER
  root 'homes#top'
  
  get "about" =>"homes#about"
  resources :relationships,     only: [:show, :create, :destroy]
  resources :followers,         only: [:show]
  resources :inquiries,         only: [:index, :show, :create] 
  resources :users,             only: [:index, :show, :edit, :update,]
  resources :boards,            onry: [:new, :show, :index, :create, :destroy] do
    resources :board_comments,  only: [:create, :destroy]
  end
  
  
  get '/search',                  to: 'searchs#search'
  get '/board_search',            to: 'board_searchs#search'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
