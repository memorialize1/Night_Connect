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
    
    get '/search',                  to: 'searchs#search'
    get '/board_search',            to: 'board_searchs#search'
    
    resources :genres,        onry: [:index, :destroy, :create]
    resources :answers,       onry: [:index, :show,:update, :create, :destroy]
    resources :users,         onry: [:index, :show, :update]
    resources :boards,        onry: [:new, :show, :index, :create, :destroy]
    
  end
  
  
  
  # USER
  root 'homes#top'
  
  get "about" =>"homes#about"
  resources :relationships,     only: [:show, :create, :destroy]
  resources :followers,         only: [:show]
  resources :inquiries,         only: [:index, :new, :show, :create] 
  resources :users,             only: [:index, :show, :edit, :update,]
  resources :boards,            onry: [:new, :show, :index, :create, :destroy] do
    resources :board_comments,  only: [:create, :destroy]
  end
  
  resources :rooms,               onry: [:new, :index, :show, :edit, :create, :update, :destroy] do
    
    resources :chat_comments,     onry: [:create, :destroy]
    resources :relation_rooms,    onry: [:create, :update, :destroy]
  end
  
  get 'rooms/:id/group_edit',               to: 'rooms#group_edit', as: 'group_edit'
  get '/search',                            to: 'searchs#search'
  get '/board_search',                      to: 'board_searchs#search'
  
  
  get '/users/:id/withdrow' => 'users#withdrow', as: 'withdrow_users'
  #退会画面への遷移
  patch '/users/:id/withdrow' => 'users#switch', as: 'withdrow_switch_users'
  #会員ステータスの切替
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
