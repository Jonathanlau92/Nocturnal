Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    patch "update_heroes_images", to: 'users#update_heroes_images', as: :update_heroes_images
  end
  resources :leagues
  resources :teams, only: :show

  get 'brackets', to: 'leagues#brackets', as: :brackets
  get 'participants', to: 'leagues#participants', as: :participants
  get "mission", to: "pages#mission"
  get "privacy", to: "pages#privacy"
  get "rules", to: "pages#rules"
  get "terms", to: "pages#terms"
  get "credits", to: "pages#credits"

  # Stripe payment path
  mount StripeEvent::Engine, at: '/stripe/webhook'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: :checkout_create
    get 'cancel', to: 'checkout#cancel', as: :checkout_cancel
    get 'success', to: 'checkout#success', as: :checkout_success
  end
   
  root to: "pages#home"
end
