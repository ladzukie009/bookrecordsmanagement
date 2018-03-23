Rails.application.routes.draw do

  resources :books
  devise_for :users

  devise_scope :user do
  authenticated :user do
    root 'books#index', as: :authenticated_root
  end

  unauthenticated do
    root 'devise/sessions#new', as: :unauthenticated_root
  end
end
end
