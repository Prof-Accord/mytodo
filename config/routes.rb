Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  root 'static_pages#home'
  get  'static_pages/about'
  get  'static_pages/help'
  resources :users, only: [:index, :show]
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new', as: :signup
    get 'signin', to: 'devise/sessions#new', as: :signin
  end
end
