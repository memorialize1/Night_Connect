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
  end
  
  
  
  # USER
  root 'homes#top'
  
  get "about" =>"homes#about"
  
  get '/users/:id/withdrow' => 'users#withdrow', as: 'withdrow_user'
  #退会画面への遷移
  patch '/users/:id/withdrow' => 'users#switch', as: 'withdrow_switch_user'
  #会員ステータスの切替

  resources :users,        only: [:index, :show, :edit, :update,]
  resources :boards,       onry: [:new, :show, :index, :create]
  resources :inquiries,    only: [:index, :show, :create] 
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
