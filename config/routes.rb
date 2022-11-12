Rails.application.routes.draw do
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }
  
  devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :post_images, only: [:index, :show, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
  end
  
  devise_for :users, controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
  }
  
  devise_scope :user do
    delete '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  scope module: :user do
    root 'homes#top'
    
    get 'users/mypage' => 'users#show', as: 'mypage'
    get 'users/about' => 'homes#about'
    get 'users/information/post_image' => 'users#post_images'
    resources :users, only: [:show, :edit, :update]
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
      resources :post_comments, only: [:create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end